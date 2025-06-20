import 'package:billiards/widgets/container/container.dart';
import 'package:billiards/widgets/container/container_body.dart';
import 'package:billiards/widgets/container/container_type.dart';
import 'package:billiards/widgets/grid/grid_item.dart';
import 'package:billiards/widgets/grid/grid_type.dart';
import 'package:billiards/widgets/text/text.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridWidget<T> extends ConsumerWidget {
  final List<T> items;
  final GridItem Function(T item, int index)? builder;
  final GridType type;
  final bool isAnimated;
  final String? emptyText;

  const GridWidget({
    super.key,
    required this.items,
    this.builder,
    this.type = GridType.defaultGrid,
    this.isAnimated = false,
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

    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(),
        mainAxisSpacing: _getMainAxisSpacing(),
        crossAxisSpacing: _getCrossAxisSpacing(),
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return _getChild(builder!(items[index], index), index);
      },
    );
  }

  int _getCrossAxisCount() {
    switch (type) {
      case GridType.defaultGrid:
        return 2;
    }
  }

  double _getMainAxisSpacing() {
    switch (type) {
      case GridType.defaultGrid:
        return 16.h;
    }
  }

  double _getCrossAxisSpacing() {
    switch (type) {
      case GridType.defaultGrid:
        return 16.w;
    }
  }

  Widget _getChild(Widget child, int index) {
    if (isAnimated) {
      child = child.animate().fadeIn().scale(delay: (index * 100).ms);
    }

    return child;
  }
}
