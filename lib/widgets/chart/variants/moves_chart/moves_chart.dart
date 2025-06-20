import 'package:billiards/widgets/chart/chart_container.dart';
import 'package:billiards/widgets/chart/chart_item.dart';
import 'package:billiards/widgets/chart/variants/moves_chart/moves_chart_colors.dart';
import 'package:billiards/widgets/chart/variants/moves_chart/moves_chart_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovesChart extends ConsumerWidget {
  final double loseMoves;
  final double errorMoves;
  final double scoreMoves;
  final double simpleMoves;

  const MovesChart({
    super.key,
    required this.loseMoves,
    required this.errorMoves,
    required this.scoreMoves,
    required this.simpleMoves,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ChartContainer(
      title: MovesChartTranslations.movesChartTitle.tr,
      height: 300,
      radius: 80.r,
      sectionsSpace: 2,
      items: [
        ChartItem(
          value: loseMoves,
          title: MovesChartTranslations.loseMoves.tr,
          color: MovesChartColors.loseMoves,
        ),
        ChartItem(
          value: errorMoves,
          title: MovesChartTranslations.errorMoves.tr,
          color: MovesChartColors.errorMoves,
        ),
        ChartItem(
          value: scoreMoves,
          title: MovesChartTranslations.scoreMoves.tr,
          color: MovesChartColors.scoreMoves,
        ),
        ChartItem(
          value: simpleMoves,
          title: MovesChartTranslations.simpleMoves.tr,
          color: MovesChartColors.simpleMoves,
        ),
      ],
    );
  }
}
