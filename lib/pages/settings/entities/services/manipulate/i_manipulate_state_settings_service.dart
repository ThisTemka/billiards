import 'package:billiards/pages/settings/entities/services/manipulate/manipulate_state_settings_service.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateStateSettingsServiceProvider =
    Provider.autoDispose<IManipulateStateSettingsService>(
        (ref) => ManipulateStateSettingsService(ref));

abstract interface class IManipulateStateSettingsService {
  void initializeState(ThemeType themeType, LanguageType languageType);
  void changeTheme(ThemeType themeType);
  void changeLanguage(LanguageType languageType);
}
