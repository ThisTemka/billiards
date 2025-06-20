import 'package:billiards/services/theme/entity/i_theme_service.dart';
import 'package:billiards/services/theme/services/manipulate/manipulate_theme_service.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:riverpod/riverpod.dart';

final manipulateThemeServiceProvider =
    Provider.autoDispose<IManipulateThemeService>((ref) {
  final themeService = ref.read(themeServiceProvider.notifier);
  return ManipulateThemeService(ref, themeService);
});

abstract interface class IManipulateThemeService {
  Future<void> setThemeType(ThemeType themeType);
}
