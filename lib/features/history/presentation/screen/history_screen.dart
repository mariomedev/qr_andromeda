import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Scaffold(
          appBar: AppBarShared(title: 'History'),
          body: BodyHistory(),
          floatingActionButton: FloatingActionButtonShared(),
          bottomNavigationBar: NavigationBarShared(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ],
    );
  }
}
