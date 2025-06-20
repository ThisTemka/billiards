import 'package:billiards/pages/home/entities/state/home_state.dart';
import 'package:billiards/pages/home/managers/i_home_manager.dart';
import 'package:billiards/pages/home/widgets/home_menu_data.dart';
import 'package:billiards/widgets/grid/grid.dart';
import 'package:billiards/widgets/grid/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/pages/home/widgets/home_card.dart';

class HomeMenu extends ConsumerWidget {
  const HomeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    final manager = ref.read(homeManagerProvider);

    return GridWidget(
      isAnimated: true,
      items: HomeMenuData.getMenu(
        manager: manager,
        state: state,
      ),
      builder: (data, index) => GridItem(
        child: HomeCard(
          title: data.title,
          icon: data.icon,
          onTap: () => data.onTap(),
        ),
      ),
    );
  }
}
