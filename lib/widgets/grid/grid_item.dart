import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;

  const GridItem({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget item = child!;

    if (onTap != null) {
      item = InkWell(
        onTap: onTap,
        child: child,
      );
    }

    return item;
  }
}
