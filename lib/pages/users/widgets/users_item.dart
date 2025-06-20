import 'package:billiards/entities/user/entity/user_extensions.dart';
import 'package:billiards/pages/users/managers/i_users_manager.dart';
import 'package:billiards/blocks/statistics/variants/user_statistics/user_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/entities/user/entity/i_user.dart';

class UsersItem extends ConsumerWidget {
  final IUser user;
  final int index;

  const UsersItem({
    super.key,
    required this.user,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _buildHeader(ref),
        _buildContent(ref),
      ],
    );
  }

  Container _buildHeader(WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    final onDeleteUser = ref.read(usersManagerProvider).deleteUser;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: theme.colors.primaryAccent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(theme.borders.cardRadius.topLeft.x),
          topRight: Radius.circular(theme.borders.cardRadius.topRight.x),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${'top'.tr} ${index + 1}',
            style: theme.textStyles.bodyMedium,
          ),
          IconButton(
            icon: Icon(Icons.delete, size: 20.w),
            color: theme.colors.errorColor,
            onPressed: () => onDeleteUser(user),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    final onViewUser = ref.read(usersManagerProvider).navigateToUser;
    return InkWell(
      onTap: () => onViewUser(user),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(theme.borders.cardRadius.bottomLeft.x),
        bottomRight: Radius.circular(theme.borders.cardRadius.bottomRight.x),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfo(ref),
            SizedBox(height: 16.h),
            UserStatistics(
              totalGames: user.rounds.toDouble(),
              winGames: user.roundWins.toDouble(),
              loseGames: user.roundLoses.toDouble(),
              accuracy: user.accuracyMove.toDouble(),
              averageMovesInLine: user.averageMovesInLine,
              averageMoveDuration:
                  user.averageMoveDuration.inSeconds.toDouble(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundColor: theme.colors.primaryAccent,
          child: Text(
            user.name[0].toUpperCase(),
            style: theme.textStyles.titleLarge.copyWith(
              color: theme.colors.accentText,
            ),
          ),
        ).animate().scale(delay: (50 * index).ms),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            user.name,
            style: theme.textStyles.titleMedium,
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: theme.colors.primaryAccent,
        ),
      ],
    );
  }
}
