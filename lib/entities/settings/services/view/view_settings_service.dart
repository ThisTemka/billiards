import 'package:billiards/entities/settings/entity/i_settings.dart';
import 'package:billiards/entities/settings/repository/i_settings_repository.dart';
import 'package:billiards/entities/settings/services/view/i_view_settings_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';

class ViewSettingsService implements IViewSettingsService {
  final Ref ref;
  final ISettingsRepository repository;

  ViewSettingsService(this.ref, this.repository);

  Future<ISettings> get settings => repository.get();

  @override
  Future<ThemeType> getThemeType() async {
    return (await settings).theme;
  }

  @override
  Future<LanguageType> getLanguageType() async {
    return (await settings).language;
  }
}
