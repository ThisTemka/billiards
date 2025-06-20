import 'package:billiards/widgets/container/container_body.dart';
import 'package:billiards/widgets/container/footer/container_footer.dart';
import 'package:billiards/widgets/container/header/container_header.dart';
import 'package:billiards/widgets/container/container_type.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatelessWidget {
  final ContainerHeader? header;
  final ContainerFooter? footer;
  final ContainerBody body;
  final ContainerType type;
  final VoidCallback? onTap;
  final bool isAnimated;

  const ContainerWidget({
    super.key,
    required this.body,
    this.header,
    this.footer,
    this.type = ContainerType.defaultContainer,
    this.onTap,
    this.isAnimated = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardWidget = GroupWidget(
      type: _getGroupType(),
      children: [
        if (header != null) header!,
        body,
        if (footer != null) footer!,
      ],
    );

    if (onTap != null) {
      cardWidget = InkWell(
        onTap: onTap,
        borderRadius: _getInkBorderRadius(),
        child: cardWidget,
      );
    }

    if (isAnimated) {
      cardWidget = cardWidget.animate().fadeIn().scale(delay: 400.ms);
    }

    return cardWidget;
  }

  BorderRadius? _getInkBorderRadius() {
    switch (type) {
      case ContainerType.card:
        return BorderRadius.only(
          bottomLeft: Radius.circular(14.r),
          bottomRight: Radius.circular(14.r),
        );
      default:
        return null;
    }
  }

  GroupType _getGroupType() {
    switch (type) {
      case ContainerType.center:
        return GroupType.centerContainer;
      case ContainerType.menuChoose:
        return GroupType.menuChoose;
      case ContainerType.defaultContainer:
        return GroupType.standart;
      case ContainerType.card:
        return GroupType.card;
      case ContainerType.text:
        return GroupType.text;
      case ContainerType.subtext:
        return GroupType.subtext;
    }
  }
}
