import 'package:billiards/pages/settings/entities/services/manipulate/i_manipulate_state_settings_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../settings_state.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';

class ManipulateStateSettingsService
    implements IManipulateStateSettingsService {
  final Ref ref;

  ManipulateStateSettingsService(this.ref);

  void setState(SettingsState state) =>
      ref.read(settingsStateProvider.notifier).state = state;
  SettingsState get state => ref.read(settingsStateProvider);

  @override
  void initializeState(ThemeType themeType, LanguageType languageType) {
    setState(state.copyWith(
      themeType: themeType,
      languageType: languageType,
      isLoading: false,
    ));
  }

  @override
  void changeTheme(ThemeType themeType) {
    setState(state.copyWith(
      themeType: themeType,
    ));
  }

  @override
  void changeLanguage(LanguageType languageType) {
    setState(state.copyWith(
      languageType: languageType,
    ));
  }
}
