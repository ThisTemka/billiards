import 'package:billiards/pages/settings/entities/services/manipulate/i_manipulate_state_settings_service.dart';
import 'package:billiards/pages/settings/managers/i_settings_manager.dart';
import 'package:billiards/pages/settings/services/communicate_to_managers/i_communicate_to_managers_settings_service.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsManager implements ISettingsManager {
  final Ref ref;

  SettingsManager(this.ref);

  ICommunicateToManagersSettingsService get communicateFeatures =>
      ref.watch(communicateToManagersSettingsServiceProvider);

  IManipulateStateSettingsService get manipulateState =>
      ref.read(manipulateStateSettingsServiceProvider);

  @override
  void loadState() {
    final themeType = communicateFeatures.getTheme();
    final languageType = communicateFeatures.getLanguage();
    manipulateState.initializeState(themeType, languageType);
  }

  @override
  Future<void> changeTheme(ThemeType themeType) async {
    await communicateFeatures.setTheme(themeType);
    manipulateState.changeTheme(themeType);
  }

  @override
  Future<void> changeLanguage(LanguageType languageType) async {
    await communicateFeatures.setLanguage(languageType);
    manipulateState.changeLanguage(languageType);
  }
}
