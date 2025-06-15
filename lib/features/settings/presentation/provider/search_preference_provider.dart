import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';

final settingPreferenceProvider = Provider<LocalStorage>((ref) {
  return SharedPreferencesAdapter();
});
