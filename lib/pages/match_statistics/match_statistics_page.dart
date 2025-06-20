import 'package:billiards/pages/match_statistics/managers/i_match_statistics_manager.dart';
import 'package:billiards/pages/match_statistics/widgets/match_statistics_content.dart';
import 'package:billiards/pages/match_statistics/widgets/match_statistics_screen.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/match_statistics/entities/state/match_statistics_state.dart';
import 'package:billiards/entities/match/entity/i_match.dart';

class MatchStatisticsPage extends ConsumerWidget {
  final IMatch match;

  const MatchStatisticsPage({super.key, required this.match});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(matchStatisticsManagerProvider);
    manager.loadState(match);

    return MatchStatisticsScreen(
      content: _buildContent(ref),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final state = ref.watch(matchStatisticsStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return MatchStatisticsContent();
  }
}
