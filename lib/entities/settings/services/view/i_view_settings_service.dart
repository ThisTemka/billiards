import 'package:billiards/entities/settings/repository/i_settings_repository.dart';
import 'package:billiards/entities/settings/services/view/view_settings_service.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:riverpod/riverpod.dart';

final viewSettingsServiceProvider =
    Provider.autoDispose<IViewSettingsService>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return ViewSettingsService(ref, repository);
});

abstract interface class IViewSettingsService {
  Future<ThemeType> getThemeType();
  Future<LanguageType> getLanguageType();
}
