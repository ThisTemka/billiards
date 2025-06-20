import 'package:billiards/services/theme/entity/borders/application_borders.dart';
import 'package:billiards/services/theme/entity/borders/i_application_borders.dart';
import 'package:billiards/services/theme/entity/colors/dark_application_theme.dart';
import 'package:billiards/services/theme/entity/colors/i_application_colors.dart';
import 'package:billiards/services/theme/entity/colors/light_application_theme.dart';
import 'package:billiards/services/theme/entity/gradients/application_gradients.dart';
import 'package:billiards/services/theme/entity/gradients/i_application_gradients.dart';
import 'package:billiards/services/theme/entity/i_theme_service.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/services/theme/entity/shadows/application_shadows.dart';
import 'package:billiards/services/theme/entity/shadows/i_application_shadows.dart';
import 'package:billiards/services/theme/entity/text_styles/application_text_styles.dart';
import 'package:billiards/services/theme/entity/text_styles/i_application_text_styles.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';

class ViewThemeService implements IViewThemeService {
  final IThemeService themeService;

  ViewThemeService(this.themeService);

  @override
  ThemeType get themeType => themeService.themeType!;

  @override
  IApplicationColors get colors => switch (themeService.themeType!) {
        ThemeType.light => LightApplicationColors(),
        ThemeType.dark => DarkApplicationColors(),
      };

  @override
  IApplicationTextStyles get textStyles => ApplicationTextStyles(colors);

  @override
  IApplicationGradients get gradients => ApplicationGradients(colors);

  @override
  IApplicationShadows get shadows => ApplicationShadows(colors);

  @override
  IApplicationBorders get borders => ApplicationBorders(colors);
}
