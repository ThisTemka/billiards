import 'package:billiards/services/theme/entity/borders/i_application_borders.dart';
import 'package:billiards/services/theme/entity/colors/i_application_colors.dart';
import 'package:billiards/services/theme/entity/gradients/i_application_gradients.dart';
import 'package:billiards/services/theme/entity/i_theme_service.dart';
import 'package:billiards/services/theme/entity/shadows/i_application_shadows.dart';
import 'package:billiards/services/theme/entity/text_styles/i_application_text_styles.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/theme/services/view/view_theme_service.dart';
import 'package:riverpod/riverpod.dart';

final viewThemeServiceProvider = Provider.autoDispose<IViewThemeService>((ref) {
  final themeService = ref.watch(themeServiceProvider);
  return ViewThemeService(themeService);
});

abstract interface class IViewThemeService {
  IApplicationColors get colors;
  IApplicationTextStyles get textStyles;
  IApplicationGradients get gradients;
  IApplicationShadows get shadows;
  IApplicationBorders get borders;
  ThemeType get themeType;
}
