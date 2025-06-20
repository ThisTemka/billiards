import 'package:billiards/widgets/list/item/list_item_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItem extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final bool isAnimated;
  final ListItemType type;

  const ListItem(
      {super.key,
      this.child,
      this.onTap,
      this.isAnimated = false,
      this.type = ListItemType.defaultListItem});

  @override
  Widget build(BuildContext context) {
    Widget item = child!;

    if (onTap != null) {
      item = InkWell(
        onTap: onTap,
        borderRadius: _getTapBorderRadius(),
        child: Material(color: _getTapColor(), child: child),
      );
    }

    return item;
  }

  BorderRadius? _getTapBorderRadius() {
    switch (type) {
      case ListItemType.defaultListItem:
        return null;
      case ListItemType.rounded:
        return BorderRadius.circular(16.r);
    }
  }

  Color _getTapColor() {
    switch (type) {
      case ListItemType.defaultListItem:
      case ListItemType.rounded:
        return Colors.transparent;
    }
  }
}
