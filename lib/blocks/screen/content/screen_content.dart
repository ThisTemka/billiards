import 'package:billiards/blocks/screen/content/screen_content_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class ScreenContent extends ConsumerWidget {
  final Widget? child;
  final ScreenContentType type;

  const ScreenContent({
    super.key,
    this.child,
    this.type = ScreenContentType.defaultScreenContent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: _getGradient(theme),
        borderRadius: theme.borders.cardRadius,
        boxShadow: theme.shadows.cardShadow,
        border: theme.borders.cardBorder,
      ),
      child: Padding(padding: _getPadding(), child: getChild(theme)),
    );
  }

  Widget getChild(IViewThemeService theme) {
    return child!;
  }

  EdgeInsets _getPadding() {
    return switch (type) {
      ScreenContentType.defaultScreenContent => EdgeInsets.all(16.w),
    };
  }

  Gradient? _getGradient(IViewThemeService theme) {
    return switch (type) {
      ScreenContentType.defaultScreenContent => theme.gradients.cardGradient,
    };
  }
}
