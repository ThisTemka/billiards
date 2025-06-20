import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'selector_item.dart';

class SelectorContainer extends ConsumerWidget {
  final List<SelectorItem> options;

  const SelectorContainer({
    super.key,
    required this.options,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.secondaryBackground.withValues(alpha: 0.1),
        borderRadius: theme.borders.primaryRadius,
      ),
      child: Column(
        children: [
          for (var i = 0; i < options.length; i++) ...[
            if (i > 0)
              Divider(
                color: theme.colors.secondaryBackground.withValues(alpha: 0.2),
                height: 1,
              ),
            options[i],
          ],
        ],
      ),
    ).animate().fadeIn().scale();
  }
}
