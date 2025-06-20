import 'package:billiards/pages/home/entities/state/home_state.dart';
import 'package:billiards/pages/home/home_translations.dart';
import 'package:billiards/pages/home/managers/i_home_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMenuData {
  final String title;
  final IconData icon;
  final Function onTap;

  HomeMenuData({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  static List<HomeMenuData> getMenu({
    required IHomeManager manager,
    required HomeState state,
  }) {
    return [
      HomeMenuData(
        title: HomeTranslations.newMatch.tr,
        icon: Icons.play_circle_outline,
        onTap: () => manager.startNewGame(),
      ),
      if (state.hasUnfinishedMatch!)
        HomeMenuData(
          title: HomeTranslations.continueMatch.tr,
          icon: Icons.history,
          onTap: () => manager.continueMatch(),
        ),
      HomeMenuData(
        title: HomeTranslations.leftMatches.tr,
        icon: Icons.timeline,
        onTap: () => manager.navigateToLeftMatches(),
      ),
      HomeMenuData(
        title: HomeTranslations.users.tr,
        icon: Icons.people,
        onTap: () => manager.navigateToUsers(),
      ),
      HomeMenuData(
        title: HomeTranslations.settings.tr,
        icon: Icons.settings,
        onTap: () => manager.navigateToSettings(),
      ),
    ];
  }
}
