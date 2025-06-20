import 'package:billiards/widgets/grid/grid.dart';
import 'package:billiards/widgets/grid/grid_item.dart';
import 'package:billiards/blocks/statistics/statistics_container.dart';
import 'package:billiards/blocks/statistics/variants/user_statistics/user_statistics_translations.dart';
import 'package:billiards/blocks/statistics/statistics_value.dart';
import 'package:billiards/blocks/statistics/variants/user_statistics/user_statistics_formats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserStatistics extends StatelessWidget {
  final double totalGames;
  final double winGames;
  final double loseGames;
  final double accuracy;
  final double averageMovesInLine;
  final double averageMoveDuration;

  const UserStatistics({
    super.key,
    required this.totalGames,
    required this.winGames,
    required this.loseGames,
    required this.accuracy,
    required this.averageMovesInLine,
    required this.averageMoveDuration,
  });

  @override
  Widget build(BuildContext context) {
    return StatisticsContainer(children: [
      Text(UserStatisticsTranslations.userStatisticsTitle.tr),
      GridWidget(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 1.5,
        items: [
          GridItem(
            children: [
              StatisticsValue(
                title: UserStatisticsTranslations.totalGames.tr,
                value: totalGames,
                format: UserStatisticsFormats.formatNumber,
              ),
            ],
          ),
          GridItem(
            children: [
              StatisticsValue(
                title: UserStatisticsTranslations.winGames.tr,
                value: winGames,
                format: UserStatisticsFormats.formatNumber,
              ),
            ],
          ),
          GridItem(
            children: [
              StatisticsValue(
                title: UserStatisticsTranslations.loseGames.tr,
                value: loseGames,
                format: UserStatisticsFormats.formatNumber,
              ),
            ],
          ),
          GridItem(
            children: [
              StatisticsValue(
                title: UserStatisticsTranslations.accuracy.tr,
                value: accuracy,
                format: UserStatisticsFormats.formatPercent,
              ),
            ],
          ),
          GridItem(
            children: [
              StatisticsValue(
                title: UserStatisticsTranslations.averageMovesInLine.tr,
                value: averageMovesInLine,
                format: UserStatisticsFormats.formatPrecision,
              ),
            ],
          ),
          GridItem(
            children: [
              StatisticsValue(
                title: UserStatisticsTranslations.averageMoveDuration.tr,
                value: averageMoveDuration,
                format: UserStatisticsFormats.formatDuration,
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
