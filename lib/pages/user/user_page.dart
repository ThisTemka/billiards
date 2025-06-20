import 'package:billiards/pages/user/entities/state/user_state.dart';
import 'package:billiards/pages/user/managers/i_user_manager.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'widgets/user_screen.dart';
import 'widgets/user_content.dart';

class UserPage extends ConsumerWidget {
  final IUser user;

  const UserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(userManagerProvider);
    manager.loadState(user);

    return UserScreen(
      content: _buildContent(ref),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final state = ref.watch(userStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return UserContent();
  }
}
