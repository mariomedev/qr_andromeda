import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:qr_andromeda/features/history/domain/domain.dart';
import 'package:qr_andromeda/features/history/presentation/providers/history_repo_provider.dart';
import 'package:qr_andromeda/features/open_show_qr/domain/domain.dart';

final historyProvider = StateNotifierProvider<HistoryNotifier, HistoryState>((
  ref,
) {
  final repoHistory = ref.watch(histoyRepoProvider);
  return HistoryNotifier(qrRepoHistory: repoHistory);
});

class HistoryNotifier extends StateNotifier<HistoryState> {
  final QRRepoHistory qrRepoHistory;
  HistoryNotifier({required this.qrRepoHistory})
    : super(
        HistoryState(
          isLoading: true,
          qrList: [],
          qrListCreated: [],
          qrListScanned: [],
        ),
      ) {
    init();
  }

  Future<void> init() async {
    state = state.copyWith(isLoading: true);

    final list = await qrRepoHistory.getListQrData(offset: 0, limit: 100);

    final created = list.where((e) => !e.isFromScan).toList();
    final scanned = list.where((e) => e.isFromScan).toList();

    state = state.copyWith(
      isLoading: false,
      qrList: list,
      qrListCreated: created,
      qrListScanned: scanned,
    );
  }

  Future<bool?> delete(int id) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await qrRepoHistory.deleteQRData(id: id);
      if (result == true && state.qrList != null) {
        final updatedList = state.qrList!.where((qr) => qr.id != id).toList();

        final created = updatedList.where((e) => !e.isFromScan).toList();
        final scanned = updatedList.where((e) => e.isFromScan).toList();

        state = state.copyWith(
          isLoading: false,
          qrList: updatedList,
          qrListCreated: created,
          qrListScanned: scanned,
        );
      }
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  void addQr(QREntity qr) {
    final List<QREntity> updatedList = [...(state.qrList ?? []), qr];

    final List<QREntity> created = updatedList
        .where((e) => !e.isFromScan)
        .toList();

    final List<QREntity> scanned = updatedList
        .where((e) => e.isFromScan)
        .toList();

    state = state.copyWith(
      qrList: updatedList,
      qrListCreated: created,
      qrListScanned: scanned,
    );
  }
}

class HistoryState {
  final bool isLoading;
  final List<QREntity>? qrList;
  final List<QREntity> qrListScanned;
  final List<QREntity> qrListCreated;

  HistoryState({
    required this.isLoading,
    required this.qrList,
    required this.qrListScanned,
    required this.qrListCreated,
  });

  HistoryState copyWith({
    bool? isLoading,
    List<QREntity>? qrList,
    List<QREntity>? qrListScanned,
    List<QREntity>? qrListCreated,
  }) => HistoryState(
    isLoading: isLoading ?? this.isLoading,
    qrList: qrList ?? this.qrList,
    qrListScanned: qrListScanned ?? this.qrListScanned,
    qrListCreated: qrListCreated ?? this.qrListCreated,
  );
}
