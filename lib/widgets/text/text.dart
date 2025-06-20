import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';
import 'package:billiards/widgets/text/text_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextWidget extends ConsumerWidget {
  final String data;
  final TextType type;
  final bool isAnimated;

  const TextWidget(
      {super.key,
      required this.data,
      this.type = TextType.mediumTitle,
      this.isAnimated = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(viewThemeServiceProvider);
    Widget textWidget = Text(
      data,
      textAlign: _getTextAlign(),
      style: _getStyle(theme),
    );

    if (isAnimated) {
      textWidget = textWidget.animate().scale(delay: 300.ms);
    }

    return textWidget;
  }

  TextAlign? _getTextAlign() {
    switch (type) {
      case TextType.mediumTitle:
        return TextAlign.center;
      default:
        return TextAlign.left;
    }
  }

  TextStyle? _getStyle(IViewThemeService theme) {
    switch (type) {
      case TextType.mediumTitle:
        return theme.textStyles.titleMedium.copyWith(
          color: _getStyleColor(theme),
        );
      case TextType.largeTitle:
        return theme.textStyles.titleLarge.copyWith(
          color: _getStyleColor(theme),
        );
      case TextType.largeBody:
        return theme.textStyles.bodyLarge.copyWith(
          color: _getStyleColor(theme),
        );
      case TextType.smallBody:
        return theme.textStyles.bodySmall.copyWith(
          color: _getStyleColor(theme),
        );
      case TextType.mediumBody:
        return theme.textStyles.bodyMedium.copyWith(
          color: _getStyleColor(theme),
        );
      case TextType.boldMediumBody:
        return theme.textStyles.bodyMedium.copyWith(
          color: _getStyleColor(theme),
          fontWeight: _getStyleWeight(),
        );
      case TextType.mediumLabel:
        return theme.textStyles.labelText.copyWith(
          color: _getStyleColor(theme),
          fontWeight: _getStyleWeight(),
        );
    }
  }

  FontWeight _getStyleWeight() {
    switch (type) {
      case TextType.boldMediumBody:
        return FontWeight.w500;
      default:
        return FontWeight.normal;
    }
  }

  Color _getStyleColor(IViewThemeService theme) {
    switch (type) {
      default:
        return theme.colors.primaryText;
    }
  }
}
