import 'package:billiards/pages/user/entities/state/user_state.dart';
import 'package:billiards/pages/user/user_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:billiards/widgets/container/container.dart';

class UserPageHeader extends ConsumerWidget {
  const UserPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    final state = ref.watch(userStateProvider);

    return ContainerWidget(
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32.r,
                backgroundColor: theme.colors.primaryAccent,
                child: Text(
                  state.user!.name[0].toUpperCase(),
                  style: theme.textStyles.titleLarge.copyWith(
                    color: theme.colors.primaryText,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.user!.name,
                      style: theme.textStyles.titleLarge,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      UserTranslations.topPosition
                          .trParams({'position': state.top.toString()}),
                      style: theme.textStyles.bodyMedium.copyWith(
                        color: theme.colors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn().slideX();
  }
}
