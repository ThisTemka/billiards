import 'package:billiards/pages/users/managers/i_users_manager.dart';
import 'package:billiards/pages/users/widgets/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/users/entities/state/users_state.dart';
import 'package:billiards/pages/users/widgets/users_content.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';

/// A page that displays a list of users with their statistics
class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(usersManagerProvider);
    manager.loadState();

    return UsersScreen(
      content: _buildContent(ref),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final state = ref.watch(usersStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return UsersContent();
  }
}
