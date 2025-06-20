import 'package:billiards/pages/round_turn/entities/state/services/manipulate/manipulate_state_round_turn_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:billiards/entities/player/entity/i_player.dart';

final manipulateStateRoundTurnServiceProvider =
    Provider.autoDispose<IManipulateStateRoundTurnService>(
        (ref) => ManipulateStateRoundTurnService(ref));

abstract interface class IManipulateStateRoundTurnService {
  void initializeState(IPlayer player);
  void incrementCurrentBall();
  void decrementCurrentBall();
  void incrementRandomBall();
  void decrementRandomBall();
  void incrementEnemyBall();
  void decrementEnemyBall();
  void toggleWhiteBall();
  void toggleBlackBall();
  void toggleTouchBall();
  void toggleTableExit();
}
