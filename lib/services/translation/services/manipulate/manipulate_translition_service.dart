import 'package:billiards/entities/settings/services/manipulate/i_manipulate_settings_service.dart';
import 'package:billiards/services/translation/entity/i_translation_service.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:billiards/services/translation/services/manipulate/i_manipulate_translition_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class ManipulateTranslationService implements IManipulateTranslationService {
  final Ref ref;
  final StateController<ITranslationService> translationService;

  ManipulateTranslationService(this.ref, this.translationService);

  IManipulateSettingsService get manipulateSettings =>
      ref.read(manipulateSettingsServiceProvider);
  ITranslationService get state => translationService.state;
  void update(ITranslationService newState) =>
      translationService.state = newState;

  @override
  Future<void> setLanguageType(LanguageType language) async {
    Get.updateLocale(language.toLocale());
    await manipulateSettings.updateLanguage(language);
  }
}
