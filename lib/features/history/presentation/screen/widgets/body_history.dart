import 'package:flutter/material.dart';

import 'widgets.dart';

class BodyHistory extends StatelessWidget {
  const BodyHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TapbarCustomHistory(),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const CardHistory(),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const CardHistory(),
            ),
          ],
        ),
      ),
    );
  }
}
