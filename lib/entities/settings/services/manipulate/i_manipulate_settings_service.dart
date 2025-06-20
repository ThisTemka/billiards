import 'package:billiards/entities/settings/services/manipulate/manipulate_settings_service.dart';
import 'package:billiards/entities/settings/repository/i_settings_repository.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateSettingsServiceProvider =
    Provider.autoDispose<IManipulateSettingsService>((ref) {
  final repository = ref.read(settingsRepositoryProvider);
  return ManipulateSettingsService(ref, repository);
});

abstract interface class IManipulateSettingsService {
  Future<void> updateTheme(ThemeType theme);
  Future<void> updateLanguage(LanguageType language);
}
