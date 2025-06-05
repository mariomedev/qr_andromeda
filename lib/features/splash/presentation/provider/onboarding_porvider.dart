import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/core.dart';
import '../../infrastruture/infrastruture.dart';
import '/features/splash/domain/domain.dart';

final sharedPreferencesAdapterProvider = Provider<SharedPreferencesAdapter>((
  ref,
) {
  return SharedPreferencesAdapter();
});

final onbordingProvider = Provider<RepoSplash>((ref) {
  final sharedPrefs = ref.read(sharedPreferencesAdapterProvider);
  return RepoSplashImpl(
    DataSplashImpl(sharedPrefs),
  );
});
