import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:billiards/services/theme/services/view/i_view_theme_service.dart';

class LoadingScreenContent extends ScreenContent {
  const LoadingScreenContent({
    super.key,
  });

  @override
  Widget getChild(IViewThemeService theme) {
    return Center(
      child: CircularProgressIndicator(
        color: theme.colors.primaryAccent,
        strokeWidth: 3.w,
      ),
    );
  }
}
