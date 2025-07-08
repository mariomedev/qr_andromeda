import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherAdapter {
  Future<bool> launchLink(String url);
  Future<bool> makePhoneCall(String phoneNumber);
}

class UrlLauncherPackage implements UrlLauncherAdapter {
  @override
  Future<bool> launchLink(String url) async {
    final Uri link = Uri.parse(url);
    if (!await launchUrl(link)) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await launchUrl(phoneUri)) {
      return false;
    }
    return true;
  }
}
