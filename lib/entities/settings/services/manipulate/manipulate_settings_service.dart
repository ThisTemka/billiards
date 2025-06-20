import 'package:billiards/entities/settings/entity/i_settings.dart';
import 'package:billiards/entities/settings/repository/i_settings_repository.dart';
import 'package:billiards/entities/settings/services/manipulate/i_manipulate_settings_service.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:riverpod/riverpod.dart';

class ManipulateSettingsService implements IManipulateSettingsService {
  final Ref ref;
  final ISettingsRepository repository;

  ManipulateSettingsService(this.ref, this.repository);

  Future<ISettings> get settings => repository.get();
  void update(ISettings settings) => repository.update(settings);

  @override
  Future<void> updateTheme(ThemeType themeType) async {
    update((await settings).copyWith(theme: themeType));
  }

  @override
  Future<void> updateLanguage(LanguageType languageType) async {
    update((await settings).copyWith(language: languageType));
  }
}
