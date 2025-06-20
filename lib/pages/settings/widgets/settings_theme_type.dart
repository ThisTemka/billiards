import 'package:billiards/pages/settings/entities/settings_state.dart';
import 'package:billiards/pages/settings/managers/i_settings_manager.dart';
import 'package:billiards/pages/settings/settings_translations.dart';
import 'package:billiards/widgets/section/section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:billiards/services/theme/entity/theme_type.dart';
import '../../../widgets/selector/selector_container.dart';
import '../../../widgets/selector/selector_item.dart';

class SettingsThemeType extends ConsumerWidget {
  const SettingsThemeType({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsStateProvider);
    final manager = ref.read(settingsManagerProvider);

    return SectionContainer(
      title: SettingsTranslations.appearance.tr,
      children: [
        SelectorContainer(
          options: [
            SelectorItem(
              title: SettingsTranslations.lightTheme.tr,
              isSelected: state.themeType == ThemeType.light,
              onTap: () => manager.changeTheme(ThemeType.light),
            ),
            SelectorItem(
              title: SettingsTranslations.darkTheme.tr,
              isSelected: state.themeType == ThemeType.dark,
              onTap: () => manager.changeTheme(ThemeType.dark),
            ),
          ],
        ),
      ],
    );
  }
}
