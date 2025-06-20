import 'package:billiards/widgets/chart/chart_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/widgets/container/container.dart';

class ChartContainer extends ConsumerWidget {
  final String title;
  final double height;
  final double radius;
  final double sectionsSpace;
  final List<ChartItem> items;

  const ChartContainer({
    super.key,
    required this.title,
    required this.height,
    required this.radius,
    required this.sectionsSpace,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    return SizedBox(
      height: height,
      child: ContainerWidget(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textStyles.titleLarge,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: PieChart(
                PieChartData(
                  sectionsSpace: sectionsSpace,
                  centerSpaceRadius: radius,
                  sections: items
                      .map((section) => section.toPieChartSectionData())
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
