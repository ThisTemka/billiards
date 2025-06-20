import 'package:billiards/services/theme/entity/borders/i_application_borders.dart';
import 'package:billiards/services/theme/entity/colors/i_application_colors.dart';
import 'package:billiards/services/theme/entity/theme_service.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/theme/entity/gradients/i_application_gradients.dart';
import 'package:billiards/services/theme/entity/shadows/i_application_shadows.dart';
import 'package:billiards/services/theme/entity/text_styles/i_application_text_styles.dart';
import 'package:riverpod/riverpod.dart';

final themeServiceProvider = StateProvider<IThemeService>((ref) {
  return ThemeService();
});

abstract interface class IThemeService {
  ThemeType? get themeType;
  IApplicationColors? get colors;
  IApplicationTextStyles? get textStyles;
  IApplicationGradients? get gradients;
  IApplicationShadows? get shadows;
  IApplicationBorders? get borders;

  IThemeService copyWith({
    ThemeType? themeType,
    IApplicationColors? colors,
    IApplicationTextStyles? textStyles,
    IApplicationGradients? gradients,
    IApplicationShadows? shadows,
    IApplicationBorders? borders,
  });
}
