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
        ),
      ) {
    init();
  }

  Future<void> init() async {
    final list = await getListQr(offset: 0, limit: 10);
    state = state.copyWith(isLoading: false, qrList: list);
  }

  Future<List<QREntity>?> getListQr({
    required int offset,
    required int limit,
  }) async {
    final listQr = await qrRepoHistory.getListQrData(
      offset: offset,
      limit: limit,
    );
    return listQr;
  }

  Future<bool> delete({required int id}) async {
    final result = await qrRepoHistory.deleteQRData(id: id);
    final newList = state.qrList.where(
      (element) {
        return element.id != id;
      },
    ).toList();
    state = state.copyWith(qrList: newList);
    return result ?? false;
  }
}

class HistoryState {
  final bool isLoading;
  final List<QREntity> qrList;

  HistoryState({
    required this.isLoading,
    required this.qrList,
  });

  HistoryState copyWith({
    bool? isLoading,
    List<QREntity>? qrList,
  }) => HistoryState(
    isLoading: isLoading ?? this.isLoading,
    qrList: qrList ?? this.qrList,
  );
}
