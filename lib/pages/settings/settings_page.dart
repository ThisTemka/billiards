import 'package:billiards/pages/settings/entities/settings_state.dart';
import 'package:billiards/pages/settings/managers/i_settings_manager.dart';
import 'package:billiards/blocks/screen/content/loading_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/settings_screen.dart';
import 'widgets/settings_content.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(settingsManagerProvider);
    manager.loadState();

    return SettingsScreen(
      content: _buildContent(ref),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final state = ref.watch(settingsStateProvider);

    if (state.isLoading) {
      return const LoadingScreenContent();
    }

    return SettingsContent();
  }
}
