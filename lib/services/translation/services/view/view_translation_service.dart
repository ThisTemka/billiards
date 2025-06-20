import 'package:billiards/services/translation/entity/i_translation_service.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:billiards/services/translation/services/view/i_view_translation_service.dart';
import 'package:get/get.dart';

class ViewTranslationService implements IViewTranslationService {
  final ITranslationService translationService;

  ViewTranslationService(this.translationService);

  @override
  LanguageType get languageType => LanguageType.fromLocale(Get.locale!);
}
