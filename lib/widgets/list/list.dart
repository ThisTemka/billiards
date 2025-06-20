import 'package:billiards/widgets/container/container.dart';
import 'package:billiards/widgets/container/container_body.dart';
import 'package:billiards/widgets/container/container_type.dart';
import 'package:billiards/widgets/list/item/list_item.dart';
import 'package:billiards/widgets/list/list_type.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ListWidget<T> extends ConsumerWidget {
  final List<T> items;
  final ListItem Function(T item, int index)? builder;
  final bool isAnimated;
  final ListType type;
  final String? emptyText;

  const ListWidget({
    super.key,
    required this.items,
    this.builder,
    this.isAnimated = false,
    this.type = ListType.defaultList,
    this.emptyText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (items.isEmpty && emptyText != null) {
      return ContainerWidget(
        type: ContainerType.center,
        body: ContainerBody(
          child: TextWidget(
            data: emptyText!,
            type: TextType.largeBody,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: _getPadding(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _getItem(builder!(items[index], index), index);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: _getSpacing());
      },
    );
  }

  Widget _getItem(Widget item, int index) {
    if (isAnimated) {
      item = item
          .animate()
          .fadeIn(duration: 300.ms, delay: (50 * index).ms)
          .slideX(begin: 0.1, end: 0, duration: 300.ms, delay: (50 * index).ms);
    }
    return item;
  }

  EdgeInsets _getPadding() {
    switch (type) {
      case ListType.defaultList:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);
    }
  }

  double _getSpacing() {
    switch (type) {
      case ListType.defaultList:
        return 8.h;
    }
  }
}
