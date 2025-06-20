import 'package:billiards/widgets/action/action_type.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:billiards/widgets/icon/icon.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionWidget extends ConsumerWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String? label;
  final ActionType type;

  const ActionWidget(
      {super.key,
      required this.onPressed,
      this.icon,
      this.label,
      this.type = ActionType.defaultActionType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onPressed,
      child: GroupWidget(
        type: GroupType.row,
        children: [
          if (icon != null)
            IconWidget(
              icon: icon,
            ),
          if (label != null)
            TextWidget(
              data: label!,
              type: TextType.mediumBody,
            ),
        ],
      ),
    );
  }
}
