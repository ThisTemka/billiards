import 'package:billiards/widgets/chart/variants/balls_chart/balls_chart_colors.dart';
import 'package:billiards/widgets/chart/variants/balls_chart/balls_chart_translations.dart';
import 'package:billiards/widgets/chart/chart_container.dart';
import 'package:billiards/widgets/chart/chart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class BallsChart extends ConsumerWidget {
  final double blackBalls;
  final double whiteBalls;
  final double randomBalls;
  final double enemyBalls;
  final double currentBalls;

  const BallsChart({
    super.key,
    required this.blackBalls,
    required this.whiteBalls,
    required this.randomBalls,
    required this.enemyBalls,
    required this.currentBalls,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ChartContainer(
      title: BallsChartTranslations.ballsChartTitle.tr,
      height: 300,
      radius: 80.r,
      sectionsSpace: 2,
      items: [
        ChartItem(
          value: blackBalls,
          title: BallsChartTranslations.blackBalls.tr,
          color: BallsChartColors.blackBalls,
        ),
        ChartItem(
          value: whiteBalls,
          title: BallsChartTranslations.whiteBalls.tr,
          color: BallsChartColors.whiteBalls,
        ),
        ChartItem(
          value: randomBalls,
          title: BallsChartTranslations.randomBalls.tr,
          color: BallsChartColors.randomBalls,
        ),
        ChartItem(
          value: enemyBalls,
          title: BallsChartTranslations.enemyBalls.tr,
          color: BallsChartColors.enemyBalls,
        ),
        ChartItem(
          value: currentBalls,
          title: BallsChartTranslations.currentBalls.tr,
          color: BallsChartColors.currentBalls,
        ),
      ],
    );
  }
}
