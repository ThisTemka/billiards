import 'package:billiards/pages/left_matches/managers/i_left_matches_manager.dart';
import 'package:billiards/pages/left_matches/widgets/left_matches_screen.dart';
import 'package:billiards/pages/left_matches/widgets/left_matches_content.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';
import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/left_matches/entities/state/left_matches_state.dart';

class LeftMatchesPage extends ConsumerWidget {
  const LeftMatchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(leftMatchesManagerProvider);
    manager.loadState();

    return LeftMatchesScreen(
      content: _buildContent(ref),
    );
  }

  ScreenContent _buildContent(WidgetRef ref) {
    final state = ref.watch(leftMatchesStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return ScreenContent(
      child: LeftMatchesContent(),
    );
  }
}
