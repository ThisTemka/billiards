import 'package:billiards/pages/left_match/entities/state/left_match_state.dart';
import 'package:billiards/pages/left_match/widgets/left_match_info.dart';
import 'package:billiards/pages/left_match/widgets/left_match_rounds.dart';
import 'package:billiards/widgets/group/group.dart';
import 'package:billiards/widgets/group/group_type.dart';
import 'package:billiards/blocks/statistics/variants/player_result_statistics/player_result_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftMatchContent extends ConsumerWidget {
  const LeftMatchContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leftMatchStateProvider);
    final match = state.match!;
    return GroupWidget(
      type: GroupType.moreSpace,
      children: [
        LeftMatchInfo(
          firstPlayerName: match.users[0].name,
          secondPlayerName: match.users[1].name,
          start: match.start,
          end: match.end,
        ),
        PlayerResultStatistics(
          leftPlayerName: match.users[0].name,
          rightPlayerName: match.users[1].name,
          leftPlayerScore: match.firstPlayerWins,
          rightPlayerScore: match.secondPlayerWins,
          isLeftPlayerWinner: match.firstPlayerWins > match.secondPlayerWins,
          firstPlayerSelfBalls: match.firstPlayerSelfBalls.toDouble(),
          secondPlayerSelfBalls: match.secondPlayerSelfBalls.toDouble(),
          firstPlayerAccuracy: match.firstPlayerAccuracy,
          secondPlayerAccuracy: match.secondPlayerAccuracy,
          firstPlayerMaxMoveInLine: match.firstPlayerMaxMoveInLine.toDouble(),
          secondPlayerMaxMoveInLine: match.secondPlayerMaxMoveInLine.toDouble(),
          firstPlayerAverageMoveDuration:
              match.firstPlayerAverageMoveDuration.inSeconds.toDouble(),
          secondPlayerAverageMoveDuration:
              match.secondPlayerAverageMoveDuration.inSeconds.toDouble(),
          firstPlayerAverageMoveInLine: match.firstPlayerAverageMoveInLine,
          secondPlayerAverageMoveInLine: match.secondPlayerAverageMoveInLine,
          firstPlayerErrorMove: match.firstPlayerErrorMove.toDouble(),
          secondPlayerErrorMove: match.secondPlayerErrorMove.toDouble(),
        ),
        LeftMatchRounds(
          rounds: match.rounds,
        )
      ],
    );
  }
}
