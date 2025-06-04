import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorProvider = StateProvider<int>((ref) {
  return 5;
});
