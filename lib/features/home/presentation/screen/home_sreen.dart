import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          QrImpl(),
          CardQrRead(),
          Scaffold(
            appBar: AppBarShared(),
            bottomNavigationBar: NavigationBarShared(),
            floatingActionButton: FloatingActionButtonShared(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
