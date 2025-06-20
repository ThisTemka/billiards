import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/widgets/icon/icon_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWidget extends ConsumerWidget {
  final IconData? icon;
  final IconType type;
  final bool isAnimated;

  const IconWidget(
      {super.key,
      this.icon,
      this.type = IconType.mediumPrimary,
      this.isAnimated = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    Widget iconWidget = Icon(
      _getIcon(),
      size: _getSize(),
      color: _getColor(theme),
    );

    if (isAnimated) {
      iconWidget = iconWidget.animate().scale(delay: 300.ms);
    }

    return iconWidget;
  }

  IconData _getIcon() {
    switch (type) {
      case IconType.error:
        return Icons.error_outline;
      default:
        return icon!;
    }
  }

  double _getSize() {
    switch (type) {
      case IconType.mediumPrimary:
        return 24.w;
      case IconType.error:
        return 20.w;
    }
  }

  Color _getColor(IViewThemeService theme) {
    switch (type) {
      case IconType.mediumPrimary:
        return theme.colors.primaryAccent;
      case IconType.error:
        return theme.colors.errorColor;
    }
  }
}
