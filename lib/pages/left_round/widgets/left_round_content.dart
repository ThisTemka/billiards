import 'package:billiards/pages/left_round/entities/state/left_round_state.dart';
import 'package:billiards/pages/left_round/widgets/left_round_info.dart';
import 'package:billiards/blocks/statistics/variants/player_result_statistics/player_result_statistics.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftRoundContent extends ConsumerWidget {
  const LeftRoundContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leftRoundStateProvider);
    final round = state.round!;
    final firstPlayer = round.players[0];
    final secondPlayer = round.players[1];

    return GroupWidget(
      type: GroupType.standart,
      children: [
        LeftRoundInfo(),
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
          firstPlayerAverageMoveInLine: firstPlayer.averageMoveInLine,
          secondPlayerAverageMoveInLine: secondPlayer.averageMoveInLine,
          firstPlayerErrorMove: firstPlayer.errorMoves.toDouble(),
          secondPlayerErrorMove: secondPlayer.errorMoves.toDouble(),
        ),
      ],
    );
  }
}
