import 'package:billiards/widgets/action/action.dart';
import 'package:billiards/widgets/container/header/container_header_type.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';

class ContainerHeader extends StatelessWidget {
  final String? title;
  final List<ActionWidget>? beforeActions;
  final List<ActionWidget>? actions;
  final ContainerHeaderType type;
  final bool isAnimated;

  const ContainerHeader({
    super.key,
    this.title,
    this.type = ContainerHeaderType.defaultContainerHeader,
    this.beforeActions,
    this.actions,
    this.isAnimated = false,
  });

  @override
  Widget build(BuildContext context) {
    return GroupWidget(
      type: _getGroupType(),
      isAnimated: isAnimated,
      children: [
        if (beforeActions != null)
          GroupWidget(
            type: GroupType.row,
            children: beforeActions!,
          ),
        if (title != null)
          TextWidget(
            data: title!,
            type: TextType.mediumTitle,
          ),
        if (actions != null)
          GroupWidget(
            type: GroupType.row,
            children: actions!,
          ),
      ],
    );
  }

  GroupType _getGroupType() {
    switch (type) {
      case ContainerHeaderType.card:
        return GroupType.card;
      default:
        return GroupType.free;
    }
  }
}
