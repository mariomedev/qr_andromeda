import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core.dart';

final urlLauncherProvider = StateNotifierProvider<UrlLauncherNotifier, bool?>((
  ref,
) {
  final urlLauncher = UrlLauncherPackage();
  return UrlLauncherNotifier(urlLauncher: urlLauncher);
});

class UrlLauncherNotifier extends StateNotifier<bool?> {
  final UrlLauncherAdapter urlLauncher;

  UrlLauncherNotifier({required this.urlLauncher}) : super(null);

  Future<bool?> launchLink(String link) async {
    try {
      await urlLauncher.launchLink(link);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> makePhoneCall(String number) async {
    try {
      await urlLauncher.makePhoneCall(number);
      return true;
    } catch (e) {
      return false;
    }
  }
}
