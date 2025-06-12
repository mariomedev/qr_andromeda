import 'package:permission_handler/permission_handler.dart';

abstract class PermissionAdapter {
  Future<bool> requestPermissionStorage();
  Future<bool> checkStoragePermission();
}

class PermissionHandler implements PermissionAdapter {
  @override
  Future<bool> requestPermissionStorage() async {
    final status = await Permission.storage.request();
    if (status.isDenied || status.isRestricted) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> checkStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isDenied || status.isRestricted) {
      return false;
    }
    return true;
  }
}
