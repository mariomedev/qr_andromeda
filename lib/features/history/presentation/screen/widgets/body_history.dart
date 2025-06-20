import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
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
              ViewQrScanned(),
              ViewQrCreated(),
            ],
          ),
        ),
      ),
    );
  }
}
