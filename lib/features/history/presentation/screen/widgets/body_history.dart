import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../../../open_show_qr/domain/domain.dart';
import '../../../../shared/providers/navigator_provider.dart';
import '../../providers/providers.dart';
import 'widgets.dart';

class BodyHistory extends StatelessWidget {
  const BodyHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TapbarCustomHistory(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.kPadding20,
          ),
          child: TabBarView(
            children: [
              _ScanQr(),
              CreateQr(),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateQr extends ConsumerStatefulWidget {
  const CreateQr({super.key});

  @override
  ConsumerState<CreateQr> createState() => _CreateQrState();
}

class _CreateQrState extends ConsumerState<CreateQr> {
  @override
  void initState() {
    ref.read(historyProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final listCreateQR = ref.watch(historyProvider).qrList;
    if (listCreateQR.isEmpty) {
      return TweenAnimationBuilder<double>(
        duration: const Duration(microseconds: 500),

        tween: Tween(begin: 0.5, end: 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppDimensions.kSpacing10,
          children: [
            const Text(
              'Created Qr Now',
              style: TextStyle(fontSize: 45),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
              ),
              onPressed: () {
                ref.read(navigatorProvider.notifier).update((state) => 0);
                context.go('/generate_qr');
              },
              child: Text(
                'Go....',
                style: TextStyle(
                  fontSize: 19,
                  color: colors.brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: listCreateQR.length,
      itemBuilder: (context, index) {
        final qr = listCreateQR[index];
        return CardHistory(
          qrEntity: qr,
        );
      },
    );
  }
}

class _ScanQr extends ConsumerWidget {
  const _ScanQr();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final List<QREntity> listScanQR = [];
    if (listScanQR.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppDimensions.kSpacing10,
        children: [
          const Text(
            'Scan Qr Now',
            style: TextStyle(fontSize: 45),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary,
            ),
            onPressed: () {
              context.push('/home');
              ref.read(navigatorProvider.notifier).update((state) => 4);
            },
            child: Text(
              'Go....',
              style: TextStyle(
                fontSize: 19,
                color: colors.brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ],
      );
    }
    return ListView.builder(
      itemCount: listScanQR.length,
      itemBuilder: (context, index) {
        return null;
      },
    );
  }
}
