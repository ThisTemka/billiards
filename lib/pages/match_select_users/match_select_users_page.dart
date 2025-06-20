import 'package:billiards/pages/match_select_users/managers/i_match_select_users_manager.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/match_select_users/entities/match_select_player_state.dart';
import 'package:billiards/pages/match_select_users/widgets/match_select_users_screen.dart';
import 'package:billiards/pages/match_select_users/widgets/match_select_users_content.dart';

class MatchSelectUsersPage extends ConsumerWidget {
  const MatchSelectUsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(matchSelectUsersManagerProvider);
    manager.loadState();

    return MatchSelectUsersScreen(
      content: _buildContent(ref),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final state = ref.watch(matchSelectPlayerStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return MatchSelectUsersContent();
  }
}
