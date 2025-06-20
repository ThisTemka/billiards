import 'package:billiards/services/translation/entity/translation_service.dart';
import 'package:riverpod/riverpod.dart';

final translationServiceProvider =
    Provider.autoDispose<ITranslationService>((ref) {
  return ref.watch(implTranslationsProvider);
});

final translationServiceControllerProvider =
    Provider.autoDispose<StateController<ITranslationService>>((ref) {
  return ref.read(implTranslationsProvider.notifier);
});

abstract interface class ITranslationService {}
