import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/left_round/managers/i_left_round_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/left_round/entities/state/left_round_state.dart';
import 'package:billiards/pages/left_round/widgets/left_round_content.dart';
import 'package:billiards/pages/left_round/widgets/left_round_screen.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';

class LeftRoundPage extends ConsumerWidget {
  final int roundIndex;
  final IRound round;

  const LeftRoundPage({
    super.key,
    required this.roundIndex,
    required this.round,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(leftRoundManagerProvider);
    manager.loadState(round, roundIndex);

    return LeftRoundScreen(
      content: _buildContent(ref),
    );
  }

  ScreenContent _buildContent(WidgetRef ref) {
    final state = ref.watch(leftRoundStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return ScreenContent(
      child: LeftRoundContent(),
    );
  }
}
