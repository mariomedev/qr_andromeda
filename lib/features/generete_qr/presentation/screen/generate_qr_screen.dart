import 'package:flutter/material.dart';
import 'package:qr_andromeda/core/constants/constants.dart';

import '../../../shared/shared.dart';
import 'widgets/widgets.dart';

class GenerateQrScreen extends StatelessWidget {
  const GenerateQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Generate QR'),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
          actions: [
            SizedBox(
              height: 40,
              width: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.onSecondaryContainer,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimensions.kBorderRadius6,
                    ),
                  ),
                ),
                onPressed: () {
                  //TODO: Go to  Setting screen
                },
                child: const Icon(Icons.menu_open_sharp),
              ),
            ),
          ],
        ),
        body: const GenerateItemCard(),
        floatingActionButton: const FloatingActionButtonShared(),
        bottomNavigationBar: const NavigationBarShared(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
