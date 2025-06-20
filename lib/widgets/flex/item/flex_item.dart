import 'package:billiards/widgets/flex/item/flex_item_type.dart';
import 'package:flutter/material.dart';

class FlexItem extends StatelessWidget {
  final Widget child;
  final FlexItemType type;

  const FlexItem({
    super.key,
    required this.child,
    this.type = FlexItemType.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: _getFlex(),
      child: child,
    );
  }

  int _getFlex() {
    switch (type) {
      case FlexItemType.expanded:
        return 1;
      case FlexItemType.none:
        return 0;
    }
  }
}
