import 'package:billiards/entities/settings/services/view/i_view_settings_service.dart';
import 'package:billiards/services/translation/services/manipulate/i_manipulate_translition_service.dart';
import 'package:riverpod/riverpod.dart';

Future<void> toolTranslationService(Ref ref) async {
  final manipulateTranslation = ref.read(manipulateTranslationServiceProvider);
  final settings = ref.watch(viewSettingsServiceProvider);

  final language = await settings.getLanguageType();
  await manipulateTranslation.setLanguageType(language);
}
