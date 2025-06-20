import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupWidget extends ConsumerWidget {
  final List<Widget> children;
  final GroupType type;
  final bool isAnimated;

  const GroupWidget(
      {super.key,
      required this.children,
      this.type = GroupType.standart,
      this.isAnimated = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    return Container(
      decoration: _getDecoration(theme),
      padding: _getPadding(),
      child: Wrap(
        direction: _getDirection(),
        alignment: _getAlignment(),
        spacing: _getSpacing(),
        children: children.asMap().entries.map((element) {
          return _getChild(element.value, element.key);
        }).toList(),
      ),
    );
  }

  Axis _getDirection() {
    switch (type) {
      case GroupType.card:
      case GroupType.row:
        return Axis.horizontal;
      default:
        return Axis.vertical;
    }
  }

  Widget _getChild(Widget child, int index) {
    if (isAnimated) {
      child = child.animate().fadeIn().scale(delay: (index * 100).ms);
    }

    return child;
  }

  EdgeInsets? _getPadding() {
    switch (type) {
      case GroupType.menuChoose:
        return EdgeInsets.all(16.w);
      case GroupType.card:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h);
      case GroupType.text:
      case GroupType.subtext:
        return EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h);
      default:
        return null;
    }
  }

  BoxDecoration? _getDecoration(IViewThemeService theme) {
    switch (type) {
      case GroupType.menuChoose:
        return BoxDecoration(
          gradient: _getDecorationGradient(theme),
          borderRadius: _getDecorationBorderRadius(),
          boxShadow: theme.shadows.cardShadow,
          border: theme.borders.cardBorder,
        );
      case GroupType.text:
      case GroupType.subtext:
        return BoxDecoration(
          color: _getDecorationColor(theme),
          borderRadius: _getDecorationBorderRadius(),
        );
      case GroupType.card:
        return BoxDecoration(
          color: _getDecorationColor(theme),
          borderRadius: _getDecorationBorderRadius(),
        );
      default:
        return null;
    }
  }

  Color? _getDecorationColor(IViewThemeService theme) {
    switch (type) {
      case GroupType.card:
      case GroupType.subtext:
        return theme.colors.primaryAccent.withValues(alpha: 0.1);
      case GroupType.text:
        return theme.colors.primaryAccent;
      default:
        return null;
    }
  }

  Gradient? _getDecorationGradient(IViewThemeService theme) {
    switch (type) {
      case GroupType.menuChoose:
        return theme.gradients.cardGradient;
      default:
        return null;
    }
  }

  BorderRadius? _getDecorationBorderRadius() {
    switch (type) {
      case GroupType.text:
      case GroupType.subtext:
        return BorderRadius.circular(20.r);
      case GroupType.menuChoose:
        return BorderRadius.circular(16.r);
      case GroupType.card:
        return BorderRadius.only(
          topLeft: Radius.circular(14.r),
          topRight: Radius.circular(14.r),
        );
      default:
        return null;
    }
  }

  double _getSpacing() {
    switch (type) {
      case GroupType.moreSpace:
        return 16.h;
      case GroupType.standart:
        return 12.h;
      case GroupType.smallLefted:
        return 8.h;
      default:
        return 0.h;
    }
  }

  WrapAlignment _getAlignment() {
    switch (type) {
      case GroupType.moreSpace:
      case GroupType.standart:
      case GroupType.centerContainer:
        return WrapAlignment.center;
      case GroupType.card:
        return WrapAlignment.spaceBetween;
      default:
        return WrapAlignment.start;
    }
  }
}
