import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsStateProvider = StateProvider<SettingsState>((ref) {
  return SettingsState();
});

class SettingsState {
  final bool isLoading;
  final ThemeType? themeType;
  final LanguageType? languageType;

  const SettingsState({
    this.isLoading = true,
    this.themeType,
    this.languageType,
  });

  SettingsState copyWith({
    bool? isLoading,
    ThemeType? themeType,
    LanguageType? languageType,
  }) {
    return SettingsState(
      isLoading: isLoading ?? this.isLoading,
      themeType: themeType ?? this.themeType,
      languageType: languageType ?? this.languageType,
    );
  }
}
