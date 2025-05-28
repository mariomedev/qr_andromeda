import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        QrImpl(),
        CardQrRead(),
        SafeArea(
          child: Scaffold(
            appBar: AppBarHome(),
            bottomNavigationBar: NavigationBarShared(),
            floatingActionButton: FloatingActionButtonShared(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
