import 'package:billiards/blocks/screen/page_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageActions extends ConsumerWidget {
  final List<PageAction> actions;

  const PageActions({
    super.key,
    required this.actions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: actions.map((action) {
        return PageAction(
          label: action.label,
          icon: action.icon,
          onPressed: action.onPressed,
          isLast: action == actions.last,
        );
      }).toList(),
    );
  }
}
