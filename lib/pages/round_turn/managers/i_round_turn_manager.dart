import 'package:billiards/pages/round_turn/managers/round_turn_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roundTurnManagerProvider =
    Provider.autoDispose<IRoundTurnManager>((ref) => RoundTurnManager(ref));

abstract interface class IRoundTurnManager {
  void loadState();
  void completeTurn();
  void closeRound();
  void navigateToHome();
  void incrementCurrentBall();
  void decrementCurrentBall();
  void incrementRandomBall();
  void decrementRandomBall();
  void incrementEnemyBall();
  void decrementEnemyBall();
  void toggleWhiteBall();
  void toggleBlackBall();
  void toggleTableExit();
  void toggleTouchBall();
}
