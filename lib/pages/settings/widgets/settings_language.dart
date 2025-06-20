import 'package:billiards/pages/settings/entities/settings_state.dart';
import 'package:billiards/pages/settings/managers/i_settings_manager.dart';
import 'package:billiards/pages/settings/settings_translations.dart';
import 'package:billiards/widgets/section/section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:billiards/services/translation/entity/language_type.dart';
import '../../../widgets/selector/selector_container.dart';
import '../../../widgets/selector/selector_item.dart';

class SettingsLanguage extends ConsumerWidget {
  const SettingsLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsStateProvider);
    final manager = ref.read(settingsManagerProvider);
    return SectionContainer(
      title: SettingsTranslations.preferences.tr,
      children: [
        SelectorContainer(
          options: [
            SelectorItem(
              title: SettingsTranslations.english.tr,
              isSelected: state.languageType == LanguageType.en,
              onTap: () => manager.changeLanguage(LanguageType.en),
            ),
            SelectorItem(
              title: SettingsTranslations.russian.tr,
              isSelected: state.languageType == LanguageType.ru,
              onTap: () => manager.changeLanguage(LanguageType.ru),
            ),
          ],
        ),
      ],
    );
  }
}
