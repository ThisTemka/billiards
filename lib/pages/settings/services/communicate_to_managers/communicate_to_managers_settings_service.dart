import 'package:billiards/pages/settings/services/communicate_to_managers/i_communicate_to_managers_settings_service.dart';
import 'package:billiards/services/theme/services/manipulate/i_manipulate_theme_service.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/services/translation/services/manipulate/i_manipulate_translition_service.dart';
import 'package:billiards/services/translation/services/view/i_view_translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';

class CommunicateToManagersSettingsService
    implements ICommunicateToManagersSettingsService {
  final Ref _ref;

  CommunicateToManagersSettingsService(this._ref);

  IManipulateThemeService get manipulateTheme =>
      _ref.read(manipulateThemeServiceProvider);
  IManipulateTranslationService get manipulateTranslation =>
      _ref.read(manipulateTranslationServiceProvider);
  IViewThemeService get viewTheme => _ref.watch(viewThemeServiceProvider);
  IViewTranslationService get viewTranslation =>
      _ref.watch(viewTranslationServiceProvider);

  @override
  Future<void> setTheme(ThemeType themeType) async {
    await manipulateTheme.setThemeType(themeType);
  }

  @override
  Future<void> setLanguage(LanguageType languageType) async {
    await manipulateTranslation.setLanguageType(languageType);
  }

  @override
  ThemeType getTheme() {
    return viewTheme.themeType;
  }

  @override
  LanguageType getLanguage() {
    return viewTranslation.languageType;
  }
}
