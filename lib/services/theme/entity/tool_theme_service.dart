import 'package:billiards/entities/settings/services/view/i_view_settings_service.dart';
import 'package:billiards/services/theme/services/manipulate/i_manipulate_theme_service.dart';
import 'package:riverpod/riverpod.dart';

Future<void> toolThemeService(Ref ref) async {
  final themeService = ref.read(manipulateThemeServiceProvider);
  final viewSettings = ref.watch(viewSettingsServiceProvider);

  final themeType = await viewSettings.getThemeType();
  await themeService.setThemeType(themeType);
}
