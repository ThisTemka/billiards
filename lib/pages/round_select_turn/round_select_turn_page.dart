import 'package:billiards/pages/round_select_turn/entities/state/round_select_turn_state.dart';
import 'package:billiards/pages/round_select_turn/managers/i_round_select_turn_manager.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/round_select_turn/widgets/round_select_turn_content.dart';
import 'package:billiards/pages/round_select_turn/widgets/round_select_turn_screen.dart';

class RoundSelectTurnPage extends ConsumerWidget {
  const RoundSelectTurnPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(roundSelectTurnManagerProvider);
    manager.loadState();

    return RoundSelectTurnScreen(
      content: _buildContent(ref),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final state = ref.watch(roundSelectTurnStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return RoundSelectTurnContent();
  }
}
