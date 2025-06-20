import 'package:billiards/services/theme/entity/tool_theme_service.dart';
import 'package:billiards/services/translation/entity/tool_translation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final applicationBootstrapProvider = FutureProvider((ref) async {
  await toolThemeService(ref);
  await toolTranslationService(ref);
});
