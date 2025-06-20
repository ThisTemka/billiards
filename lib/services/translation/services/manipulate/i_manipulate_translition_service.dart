import 'package:billiards/services/translation/entity/i_translation_service.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:billiards/services/translation/services/manipulate/manipulate_translition_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateTranslationServiceProvider =
    Provider<IManipulateTranslationService>((ref) {
  final translationServiceController =
      ref.read(translationServiceControllerProvider);
  return ManipulateTranslationService(ref, translationServiceController);
});

abstract interface class IManipulateTranslationService {
  Future<void> setLanguageType(LanguageType language);
}
