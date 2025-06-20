import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/widgets/flex/flex_type.dart';
import 'package:billiards/widgets/flex/item/flex_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlexWidget extends ConsumerWidget {
  final List<FlexItem> items;
  final FlexType type;

  const FlexWidget({
    super.key,
    required this.items,
    this.type = FlexType.row,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    return Container(
      padding: _getPadding(),
      decoration: _getDecoration(theme),
      child: Flex(
        direction: _getDirection(),
        mainAxisAlignment: _getMainAxisAlignment(),
        children: items,
      ),
    );
  }

  BoxDecoration? _getDecoration(IViewThemeService theme) {
    switch (type) {
      case FlexType.card:
        return BoxDecoration(
          gradient: theme.gradients.headerGradient,
          boxShadow: theme.shadows.headerShadow,
        );
      default:
        return null;
    }
  }

  EdgeInsets _getPadding() {
    switch (type) {
      case FlexType.card:
        return EdgeInsets.all(16.w);
      case FlexType.row:
        return EdgeInsets.symmetric(horizontal: 16.w);
      default:
        return EdgeInsets.zero;
    }
  }

  MainAxisAlignment _getMainAxisAlignment() {
    switch (type) {
      case FlexType.row:
        return MainAxisAlignment.spaceBetween;
      case FlexType.column:
        return MainAxisAlignment.center;
      default:
        return MainAxisAlignment.start;
    }
  }

  Axis _getDirection() {
    switch (type) {
      case FlexType.row:
        return Axis.horizontal;
      default:
        return Axis.vertical;
    }
  }
}
