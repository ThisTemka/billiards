import 'package:billiards/pages/round_statistics/managers/i_round_statistics_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/round_statistics/entities/state/round_statistics_state.dart';
import 'package:billiards/pages/round_statistics/widgets/round_statistics_screen.dart';
import 'package:billiards/pages/round_statistics/widgets/round_statistics_content.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';
import 'package:billiards/entities/round/entity/i_round.dart';

class RoundStatisticsPage extends ConsumerWidget {
  final IRound round;

  const RoundStatisticsPage({super.key, required this.round});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(roundStatisticsManagerProvider);
    manager.loadState(round);

    return RoundStatisticsScreen(
      content: _buildContent(ref),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final state = ref.watch(roundStatisticsStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return RoundStatisticsContent();
  }
}
