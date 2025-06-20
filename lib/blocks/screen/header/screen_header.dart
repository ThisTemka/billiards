import 'package:billiards/widgets/flex/flex.dart';
import 'package:billiards/widgets/flex/flex_type.dart';
import 'package:billiards/widgets/flex/item/flex_item.dart';
import 'package:billiards/widgets/flex/item/flex_item_type.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:billiards/blocks/screen/header/screen_header_type.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScreenHeader extends ConsumerWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final ScreenHeaderType type;
  final bool isAnimated;

  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.isAnimated = false,
    this.type = ScreenHeaderType.defaultScreenHeader,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget header = FlexWidget(
      type: FlexType.row,
      items: [
        FlexItem(
          child: GroupWidget(
            type: GroupType.smallLefted,
            children: [
              TextWidget(
                data: title.tr,
                type: TextType.largeTitle,
              ),
              if (subtitle != null)
                TextWidget(data: subtitle!.tr, type: TextType.largeBody),
            ],
          ),
        ),
        if (trailing != null)
          FlexItem(type: FlexItemType.none, child: trailing!),
      ],
    );

    if (isAnimated) {
      header = header.animate().fadeIn().slideX();
    }

    return header;
  }
}
