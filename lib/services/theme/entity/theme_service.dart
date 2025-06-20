import 'package:billiards/services/theme/entity/borders/i_application_borders.dart';
import 'package:billiards/services/theme/entity/colors/i_application_colors.dart';
import 'package:billiards/services/theme/entity/i_theme_service.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/theme/entity/gradients/i_application_gradients.dart';
import 'package:billiards/services/theme/entity/shadows/i_application_shadows.dart';
import 'package:billiards/services/theme/entity/text_styles/i_application_text_styles.dart';

class ThemeService implements IThemeService {
  @override
  final ThemeType? themeType;
  @override
  final IApplicationColors? colors;
  @override
  final IApplicationTextStyles? textStyles;
  @override
  final IApplicationGradients? gradients;
  @override
  final IApplicationShadows? shadows;
  @override
  final IApplicationBorders? borders;

  ThemeService({
    this.themeType,
    this.colors,
    this.textStyles,
    this.gradients,
    this.shadows,
    this.borders,
  });

  @override
  IThemeService copyWith({
    ThemeType? themeType,
    IApplicationColors? colors,
    IApplicationTextStyles? textStyles,
    IApplicationGradients? gradients,
    IApplicationShadows? shadows,
    IApplicationBorders? borders,
  }) {
    return ThemeService(
      themeType: themeType,
      colors: colors,
      textStyles: textStyles,
      gradients: gradients,
      shadows: shadows,
      borders: borders,
    );
  }
}
