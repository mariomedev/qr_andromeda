import 'package:qr_andromeda/features/splash/domain/domain.dart';

class RepoSplashImpl implements RepoSplash {
  final DataSplash dataSource;

  RepoSplashImpl(this.dataSource);
  @override
  Future<bool?> getStatusOnboarding(String key) async {
    return await dataSource.getStatusOnboarding(key);
  }

  @override
  Future<void> saveStatusOnboarding(String key, bool value) async {
    await dataSource.saveStatusOnboarding(key, value);
  }
}
