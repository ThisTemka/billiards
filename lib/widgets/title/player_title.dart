import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class PlayerTitle extends ConsumerWidget {
  final String playerName;
  final int score;
  final bool isWinner;
  final double iconSize;
  final IconData? winnerIcon;

  const PlayerTitle({
    super.key,
    required this.playerName,
    required this.score,
    required this.isWinner,
    this.iconSize = 24,
    this.winnerIcon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: iconSize.h,
          child: isWinner
              ? Icon(
                  winnerIcon ?? Icons.emoji_events,
                  color: theme.colors.primaryAccent,
                  size: iconSize.w,
                ).animate().scale(delay: 500.ms)
              : null,
        ),
        SizedBox(height: 4.h),
        Text(
          '$score',
          style: theme.textStyles.statValue,
        ),
        SizedBox(height: 4.h),
        Text(
          playerName,
          style: theme.textStyles.titleLarge,
        ),
      ],
    );
  }
}
