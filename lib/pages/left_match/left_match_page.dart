import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/pages/left_match/managers/i_left_match_manager.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';
import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/left_match/entities/state/left_match_state.dart';
import 'package:billiards/pages/left_match/widgets/left_match_content.dart';
import 'package:billiards/pages/left_match/widgets/left_match_screen.dart';

class LeftMatchPage extends ConsumerWidget {
  final IMatch match;

  const LeftMatchPage({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(leftMatchManagerProvider);
    manager.loadState(match);

    return LeftMatchScreen(
      content: _buildContent(ref),
    );
  }

  ScreenContent _buildContent(WidgetRef ref) {
    final state = ref.watch(leftMatchStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return ScreenContent(
      child: LeftMatchContent(),
    );
  }
}
