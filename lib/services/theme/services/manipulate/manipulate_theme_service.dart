import 'package:billiards/entities/settings/services/manipulate/i_manipulate_settings_service.dart';
import 'package:billiards/services/theme/entity/borders/application_borders.dart';
import 'package:billiards/services/theme/entity/borders/i_application_borders.dart';
import 'package:billiards/services/theme/entity/colors/dark_application_theme.dart';
import 'package:billiards/services/theme/entity/colors/i_application_colors.dart';
import 'package:billiards/services/theme/entity/colors/light_application_theme.dart';
import 'package:billiards/services/theme/entity/gradients/application_gradients.dart';
import 'package:billiards/services/theme/entity/gradients/i_application_gradients.dart';
import 'package:billiards/services/theme/services/manipulate/i_manipulate_theme_service.dart';
import 'package:billiards/services/theme/entity/i_theme_service.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/theme/entity/shadows/application_shadows.dart';
import 'package:billiards/services/theme/entity/shadows/i_application_shadows.dart';
import 'package:billiards/services/theme/entity/text_styles/application_text_styles.dart';
import 'package:billiards/services/theme/entity/text_styles/i_application_text_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManipulateThemeService implements IManipulateThemeService {
  final Ref ref;
  final StateController<IThemeService> themeService;

  ManipulateThemeService(this.ref, this.themeService);

  IManipulateSettingsService get manipulateSettings =>
      ref.read(manipulateSettingsServiceProvider);
  IThemeService get state => themeService.state;
  void update(IThemeService newState) => themeService.state = newState;

  @override
  Future<void> setThemeType(ThemeType themeType) async {
    final colors = _getColors(themeType);
    update(state.copyWith(
      themeType: themeType,
      colors: colors,
      textStyles: _getTextStyles(themeType, colors),
      gradients: _getGradients(themeType, colors),
      shadows: _getShadows(themeType, colors),
      borders: _getBorders(themeType, colors),
    ));
    await manipulateSettings.updateTheme(themeType);
  }

  IApplicationColors _getColors(ThemeType type) {
    return switch (type) {
      ThemeType.light => LightApplicationColors(),
      ThemeType.dark => DarkApplicationColors(),
    };
  }

  IApplicationTextStyles _getTextStyles(
      ThemeType type, IApplicationColors colors) {
    return ApplicationTextStyles(colors);
  }

  IApplicationGradients _getGradients(
      ThemeType type, IApplicationColors colors) {
    return ApplicationGradients(colors);
  }

  IApplicationShadows _getShadows(ThemeType type, IApplicationColors colors) {
    return ApplicationShadows(colors);
  }

  IApplicationBorders _getBorders(ThemeType type, IApplicationColors colors) {
    return ApplicationBorders(colors);
  }
}
