import 'package:billiards/services/translation/entity/translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

final translationsProvider = Provider<Translations>((ref) {
  return ref.watch(implTranslationsProvider);
});
