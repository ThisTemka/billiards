import 'package:billiards/pages/settings/services/communicate_to_managers/communicate_to_managers_settings_service.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communicateToManagersSettingsServiceProvider =
    Provider.autoDispose<ICommunicateToManagersSettingsService>(
        (ref) => CommunicateToManagersSettingsService(ref));

abstract interface class ICommunicateToManagersSettingsService {
  Future<void> setTheme(ThemeType themeType);
  Future<void> setLanguage(LanguageType languageType);
  ThemeType getTheme();
  LanguageType getLanguage();
}
