import 'package:billiards/pages/match_statistics/entities/state/match_statistics_state.dart';
import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:billiards/blocks/statistics/variants/player_result_statistics/player_result_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchStatisticsContent extends ConsumerWidget {
  const MatchStatisticsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(matchStatisticsStateProvider);
    final match = state.match!;
    return ScreenContent(
      child: [
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
          firstPlayerAverageMoveInLine:
              match.firstPlayerAverageMoveInLine.toDouble(),
          secondPlayerAverageMoveInLine:
              match.secondPlayerAverageMoveInLine.toDouble(),
          firstPlayerErrorMove: match.firstPlayerErrorMove.toDouble(),
          secondPlayerErrorMove: match.secondPlayerErrorMove.toDouble(),
        ),
      ],
    );
  }
}
