import 'package:billiards/pages/round_turn/managers/i_round_turn_manager.dart';
import 'package:billiards/pages/round_turn/entities/state/round_turn_state.dart';
import 'package:billiards/pages/round_turn/widgets/round_turn_content.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/round_turn/widgets/round_turn_screen.dart';

class RoundTurnPage extends ConsumerWidget {
  const RoundTurnPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(roundTurnManagerProvider);
    manager.loadState();

    return RoundTurnScreen(
      content: _buildContent(ref),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final state = ref.watch(roundTurnStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return RoundTurnContent();
  }
}
