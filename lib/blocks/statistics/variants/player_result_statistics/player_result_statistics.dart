import 'package:billiards/widgets/list/item/list_item.dart';
import 'package:billiards/blocks/statistics/variants/player_result_statistics/player_result_statistics_formats.dart';
import 'package:billiards/widgets/list/list.dart';
import 'package:billiards/blocks/statistics/variants/player_result_statistics/player_result_statistics_translations.dart';
import 'package:billiards/blocks/statistics/statistics_container.dart';
import 'package:billiards/widgets/title/player_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../statistics_bar/double_statistics_bar.dart';

class PlayerResultStatistics extends StatelessWidget {
  final String leftPlayerName;
  final String rightPlayerName;
  final int leftPlayerScore;
  final int rightPlayerScore;
  final bool isLeftPlayerWinner;

  final double firstPlayerSelfBalls;
  final double secondPlayerSelfBalls;
  final double firstPlayerAccuracy;
  final double secondPlayerAccuracy;
  final double firstPlayerMaxMoveInLine;
  final double secondPlayerMaxMoveInLine;
  final double firstPlayerAverageMoveDuration;
  final double secondPlayerAverageMoveDuration;
  final double firstPlayerAverageMoveInLine;
  final double secondPlayerAverageMoveInLine;
  final double firstPlayerErrorMove;
  final double secondPlayerErrorMove;

  const PlayerResultStatistics({
    super.key,
    required this.leftPlayerName,
    required this.rightPlayerName,
    required this.leftPlayerScore,
    required this.rightPlayerScore,
    required this.isLeftPlayerWinner,
    required this.firstPlayerSelfBalls,
    required this.secondPlayerSelfBalls,
    required this.firstPlayerAccuracy,
    required this.secondPlayerAccuracy,
    required this.firstPlayerMaxMoveInLine,
    required this.secondPlayerMaxMoveInLine,
    required this.firstPlayerAverageMoveDuration,
    required this.secondPlayerAverageMoveDuration,
    required this.firstPlayerAverageMoveInLine,
    required this.secondPlayerAverageMoveInLine,
    required this.firstPlayerErrorMove,
    required this.secondPlayerErrorMove,
  });

  @override
  Widget build(BuildContext context) {
    return StatisticsContainer(children: [
      Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            Expanded(
              child: PlayerTitle(
                playerName: leftPlayerName,
                score: leftPlayerScore,
                isWinner: isLeftPlayerWinner,
              ),
            ),
            Expanded(
              child: PlayerTitle(
                playerName: rightPlayerName,
                score: rightPlayerScore,
                isWinner: !isLeftPlayerWinner,
              ),
            ),
          ],
        ),
      ),
      ListWidget(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        items: [
          ListItem(
            index: 0,
            children: [
              DoubleStatisticsBar(
                title: PlayerResultStatisticsTranslations.balls.tr,
                format: PlayerResultStatisticsFormats.formatNumber,
                isLessBetter: false,
                firstValue: firstPlayerSelfBalls,
                secondValue: secondPlayerSelfBalls,
              ),
            ],
          ),
          ListItem(
            index: 1,
            children: [
              DoubleStatisticsBar(
                title: PlayerResultStatisticsTranslations.accuracy.tr,
                format: PlayerResultStatisticsFormats.formatPercent,
                isLessBetter: false,
                firstValue: firstPlayerAccuracy,
                secondValue: secondPlayerAccuracy,
              ),
            ],
          ),
          ListItem(
            index: 2,
            children: [
              DoubleStatisticsBar(
                title: PlayerResultStatisticsTranslations.maxMoveInLine.tr,
                format: PlayerResultStatisticsFormats.formatNumber,
                isLessBetter: false,
                firstValue: firstPlayerMaxMoveInLine,
                secondValue: secondPlayerMaxMoveInLine,
              ),
            ],
          ),
          ListItem(
            index: 3,
            children: [
              DoubleStatisticsBar(
                title:
                    PlayerResultStatisticsTranslations.averageMoveDuration.tr,
                format: PlayerResultStatisticsFormats.formatDuration,
                isLessBetter: true,
                firstValue: firstPlayerAverageMoveDuration,
                secondValue: secondPlayerAverageMoveDuration,
              ),
            ],
          ),
          ListItem(
            index: 4,
            children: [
              DoubleStatisticsBar(
                title: PlayerResultStatisticsTranslations.averageMoveInLine.tr,
                format: PlayerResultStatisticsFormats.formatPrecision,
                isLessBetter: false,
                firstValue: firstPlayerAverageMoveInLine,
                secondValue: secondPlayerAverageMoveInLine,
              ),
            ],
          ),
          ListItem(
            index: 5,
            children: [
              DoubleStatisticsBar(
                title: PlayerResultStatisticsTranslations.errorMove.tr,
                format: PlayerResultStatisticsFormats.formatNumber,
                isLessBetter: true,
                firstValue: firstPlayerErrorMove,
                secondValue: secondPlayerErrorMove,
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
