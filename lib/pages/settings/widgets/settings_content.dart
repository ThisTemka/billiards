import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'settings_theme_type.dart';
import 'settings_language.dart';

class SettingsContent extends ConsumerWidget {
  const SettingsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenContent(
      child: [
        SettingsThemeType(),
        SizedBox(height: 24.h),
        SettingsLanguage(),
      ],
    );
  }
}
