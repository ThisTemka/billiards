import 'package:billiards/widgets/container/footer/container_footer_type.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:flutter/material.dart';

class ContainerFooter extends StatelessWidget {
  final ContainerFooterType type;
  final Widget? child;

  const ContainerFooter({super.key, required this.type, required this.child});

  @override
  Widget build(BuildContext context) {
    return GroupWidget(
      type: _getGroupType(),
      children: [
        if (child != null) child!,
      ],
    );
  }

  GroupType _getGroupType() {
    switch (type) {
      case ContainerFooterType.card:
        return GroupType.card;
      default:
        return GroupType.free;
    }
  }
}
