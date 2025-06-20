import 'package:billiards/blocks/screen/content/screen_content.dart';
import 'package:flutter/material.dart';
import 'package:billiards/pages/round_select_turn/widgets/round_select_turn_select_turn.dart';

class RoundSelectTurnContent extends StatelessWidget {
  const RoundSelectTurnContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenContent(child: [RoundSelectTurnSelectTurn()]);
  }
}
