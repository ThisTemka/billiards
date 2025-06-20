import 'package:billiards/pages/home/managers/i_home_manager.dart';
import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/home/entities/state/home_state.dart';
import 'package:billiards/pages/home/widgets/home_screen.dart';
import 'package:billiards/pages/home/widgets/home_content.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(homeManagerProvider);
    manager.loadState();

    return HomeScreen(
      content: _buildContent(ref),
    );
  }

  ScreenContent _buildContent(WidgetRef ref) {
    final state = ref.watch(homeStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return ScreenContent(
      child: HomeContent(),
    );
  }
}
