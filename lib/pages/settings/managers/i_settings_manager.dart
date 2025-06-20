import 'package:billiards/pages/settings/managers/settings_manager.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsManagerProvider =
    Provider.autoDispose<ISettingsManager>((ref) => SettingsManager(ref));

abstract interface class ISettingsManager {
  void loadState();
  void changeTheme(ThemeType themeType);
  void changeLanguage(LanguageType languageType);
}
