import 'package:billiards/pages/match_select_users/entities/match_select_player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class MatchSelectUsersUserInput extends ConsumerWidget {
  final String label;
  final Function(bool) onFocused;
  final Function(String) onQueryChanged;
  final Function(String) onCreateUser;
  final bool isSelected;
  final bool isFocused;

  const MatchSelectUsersUserInput({
    super.key,
    required this.label,
    required this.onFocused,
    required this.onQueryChanged,
    required this.onCreateUser,
    required this.isSelected,
    required this.isFocused,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    final state = ref.watch(matchSelectPlayerStateProvider);
    final controller = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.primaryBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Focus(
                  onFocusChange: (value) => onFocused(value),
                  child: TextField(
                    controller: controller,
                    style: theme.textStyles.bodyLarge,
                    onChanged: (value) => onQueryChanged(value),
                    decoration: InputDecoration(
                      labelText: label,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      labelStyle: theme.textStyles.bodyMedium,
                    ),
                  ),
                ),
              ),
              if (!isSelected)
                IconButton(
                  icon: Icon(Icons.person_add, color: theme.colors.primaryText),
                  onPressed: () {
                    onCreateUser(controller.text);
                    FocusScope.of(context).unfocus();
                  },
                ),
            ],
          ),
          if (isFocused && state.users.isNotEmpty)
            Container(
              constraints: BoxConstraints(
                maxHeight: 100.h,
              ),
              margin: EdgeInsets.only(top: 8.h),
              decoration: BoxDecoration(
                color: theme.colors.primaryBackground,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color:
                        theme.colors.primaryBackground.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    dense: true,
                    title: Text(
                      user.name,
                      style: theme.textStyles.bodyMedium.copyWith(
                        color: theme.colors.primaryText,
                      ),
                    ),
                    onTap: () {
                      controller.text = user.name;
                      onQueryChanged(user.name);
                      FocusScope.of(context).unfocus();
                    },
                  );
                },
              ),
            ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }
}
