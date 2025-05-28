import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class GenerateQrScreen extends StatelessWidget {
  const GenerateQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppBarShared(title: 'Generate QR'),
        body: GenerateItemCard(),
        floatingActionButton: FloatingActionButtonShared(),
        bottomNavigationBar: NavigationBarShared(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
