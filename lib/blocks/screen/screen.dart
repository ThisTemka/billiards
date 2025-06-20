import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:billiards/blocks/screen/header/screen_header.dart';
import 'package:billiards/blocks/screen/screen_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class ScreenWidget extends ConsumerWidget {
  final ScreenContent content;
  final ScreenHeader? header;
  final ScreenType type;
  final Widget? actions;

  const ScreenWidget({
    super.key,
    required this.content,
    this.header,
    this.type = ScreenType.defaultScreen,
    this.actions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: theme.gradients.primaryGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: _getPadding(),
            child: Column(
              children: [
                if (header != null) ...[
                  header!,
                  SizedBox(height: 24.h),
                ],
                Expanded(child: content),
                if (actions != null) ...[
                  SizedBox(height: 16.h),
                  actions!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets _getPadding() {
    switch (type) {
      case ScreenType.defaultScreen:
        return EdgeInsets.symmetric(horizontal: 24.w);
    }
  }
}
