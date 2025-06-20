import 'package:billiards/entities/user/entity/user_extensions.dart';
import 'package:billiards/pages/user/entities/state/user_state.dart';
import 'package:billiards/blocks/statistics/variants/user_statistics/user_statistics.dart';
import 'package:flutter/material.dart';
import 'package:billiards/widgets/chart/variants/balls_chart/balls_chart.dart';
import 'package:billiards/widgets/chart/variants/moves_chart/moves_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserContent extends ConsumerWidget {
  const UserContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateProvider).user!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserStatistics(
          totalGames: user.rounds.toDouble(),
          winGames: user.roundWins.toDouble(),
          loseGames: user.roundLoses.toDouble(),
          accuracy: user.accuracyMove.toDouble(),
          averageMovesInLine: user.averageMovesInLine.toDouble(),
          averageMoveDuration: user.averageMoveDuration.inSeconds.toDouble(),
        ),
        const SizedBox(height: 24),
        BallsChart(
          blackBalls: user.blackBalls.toDouble(),
          whiteBalls: user.whiteBalls.toDouble(),
          randomBalls: user.randomBalls.toDouble(),
          enemyBalls: user.enemyBalls.toDouble(),
          currentBalls: user.currentBalls.toDouble(),
        ),
        const SizedBox(height: 24),
        MovesChart(
          loseMoves: user.loseMoves.toDouble(),
          errorMoves: user.errorMoves.toDouble(),
          scoreMoves: user.scoreMoves.toDouble(),
          simpleMoves: user.simpleMoves.toDouble(),
        ),
      ],
    );
  }
}
