import 'package:billiards/pages/round_statistics/entities/state/round_statistics_state.dart';
import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:billiards/blocks/statistics/variants/player_result_statistics/player_result_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoundStatisticsContent extends ConsumerWidget {
  const RoundStatisticsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(roundStatisticsStateProvider);
    final firstPlayer = state.round!.players[0];
    final secondPlayer = state.round!.players[1];

    return ScreenContent(
      child: [
        PlayerResultStatistics(
          leftPlayerName: firstPlayer.user.name,
          rightPlayerName: secondPlayer.user.name,
          leftPlayerScore: firstPlayer.win ? 1 : 0,
          rightPlayerScore: secondPlayer.win ? 1 : 0,
          isLeftPlayerWinner: firstPlayer.win,
          firstPlayerSelfBalls: firstPlayer.selfBalls.toDouble(),
          secondPlayerSelfBalls: secondPlayer.selfBalls.toDouble(),
          firstPlayerAccuracy: firstPlayer.accuracyMove,
          secondPlayerAccuracy: secondPlayer.accuracyMove,
          firstPlayerMaxMoveInLine: firstPlayer.maxMoveInLine.toDouble(),
          secondPlayerMaxMoveInLine: secondPlayer.maxMoveInLine.toDouble(),
          firstPlayerAverageMoveDuration:
              firstPlayer.averageMoveDuration.inSeconds.toDouble(),
          secondPlayerAverageMoveDuration:
              secondPlayer.averageMoveDuration.inSeconds.toDouble(),
          firstPlayerAverageMoveInLine:
              firstPlayer.averageMoveInLine.toDouble(),
          secondPlayerAverageMoveInLine:
              secondPlayer.averageMoveInLine.toDouble(),
          firstPlayerErrorMove: firstPlayer.errorMoves.toDouble(),
          secondPlayerErrorMove: secondPlayer.errorMoves.toDouble(),
        ),
      ],
    );
  }
}
