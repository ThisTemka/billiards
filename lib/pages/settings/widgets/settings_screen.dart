import 'package:billiards/pages/settings/settings_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/blocks/screen/screen.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:get/get.dart';

class SettingsScreen extends ConsumerWidget {
  final Widget content;

  const SettingsScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenWidget(
      header: ScreenHeader(
        title: SettingsTranslations.settingsTitle.tr,
        isAnimated: true,
      ),
      content: content,
    );
  }
}
