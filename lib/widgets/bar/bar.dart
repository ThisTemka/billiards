import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class BarWidget extends ConsumerWidget {
  final double value;
  final bool isReverse;
  final double height;
  final Color? color;

  const BarWidget({
    super.key,
    required this.value,
    this.isReverse = false,
    this.height = 8,
    this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    return Stack(
      children: [
        Container(
          height: height.h,
          decoration: BoxDecoration(
            color: theme.colors.secondaryBackground.withAlpha(51),
            borderRadius: theme.borders.primaryRadius,
          ),
        ),
        Positioned.fill(
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment:
                      isReverse ? Alignment.centerLeft : Alignment.centerRight,
                  child: FractionallySizedBox(
                    widthFactor: value,
                    child: Container(
                      height: height.h,
                      decoration: BoxDecoration(
                        color: color ?? theme.colors.primaryAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.r),
                          bottomLeft: Radius.circular(4.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
