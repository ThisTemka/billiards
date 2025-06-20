import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:billiards/pages/match_select_users/widgets/match_select_users_select_users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchSelectUsersContent extends ConsumerWidget {
  const MatchSelectUsersContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenContent(
      child: [
        MatchSelectUsersSelectUsers(),
      ],
    ).animate().fadeIn(duration: 500.ms);
  }
}
