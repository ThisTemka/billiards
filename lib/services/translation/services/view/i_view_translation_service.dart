import 'package:billiards/services/translation/entity/i_translation_service.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import 'package:billiards/services/translation/services/view/view_translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewTranslationServiceProvider =
    Provider.autoDispose<IViewTranslationService>((ref) {
  final translationService = ref.watch(translationServiceProvider);
  return ViewTranslationService(translationService);
});

abstract interface class IViewTranslationService {
  LanguageType get languageType;
}
