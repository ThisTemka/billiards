import 'package:billiards/pages/match_select_users/entities/match_select_player_state.dart';
import 'package:billiards/pages/match_select_users/managers/i_match_select_users_manager.dart';
import 'package:billiards/pages/match_select_users/match_select_users_translations.dart';
import 'package:billiards/widgets/section/section_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/pages/match_select_users/widgets/match_select_users_user_input.dart';

class MatchSelectUsersSelectUsers extends ConsumerWidget {
  const MatchSelectUsersSelectUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(matchSelectUsersManagerProvider);
    final state = ref.watch(matchSelectPlayerStateProvider);
    final theme = ref.watch(viewThemeServiceProvider);

    return SectionContainer(
        title: MatchSelectUsersTranslations.selectPlayers.tr,
        children: [
          MatchSelectUsersUserInput(
            label: MatchSelectUsersTranslations.player1.tr,
            isSelected: state.isFirstUserSelected,
            isFocused: state.focusedUserIndex == 0,
            onFocused: (focused) => manager.focusUserInput(focused, 0),
            onQueryChanged: (value) => manager.changeQuery(value, 0),
            onCreateUser: (value) => manager.createUser(value, 0),
          ),
          SizedBox(height: 16.h),
          MatchSelectUsersUserInput(
            label: MatchSelectUsersTranslations.player2.tr,
            isSelected: state.isSecondUserSelected,
            isFocused: state.focusedUserIndex == 1,
            onFocused: (focused) => manager.focusUserInput(focused, 1),
            onQueryChanged: (value) => manager.changeQuery(value, 1),
            onCreateUser: (value) => manager.createUser(value, 1),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () => manager.startNewMatch(),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colors.primaryBackground,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              MatchSelectUsersTranslations.startGame.tr,
              style: theme.textStyles.bodyLarge.copyWith(
                color: theme.colors.accentText,
              ),
            ),
          ).animate().fadeIn(duration: 500.ms),
        ]);
  }
}
