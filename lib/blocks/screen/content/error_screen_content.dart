import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class ErrorScreenContent extends ScreenContent {
  final String error;

  const ErrorScreenContent({
    super.key,
    required this.error,
  });

  @override
  Widget getChild(IViewThemeService theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48.w,
            color: theme.colors.errorColor,
          ),
          SizedBox(height: 16.h),
          Text(
            error,
            style: theme.textStyles.bodyLarge.copyWith(
              color: theme.colors.errorColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
