import 'package:billiards/entities/game_state/entity/game_status.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/services/store/main/services/use/i_entity.dart';

abstract interface class IGameState implements IEntity {
  IMatch? get currentMatch;
  IRound? get currentRound;
  IPlayer? get currentPlayer;
  GameStatus get gameStatus;

  IGameState copyWith({
    bool nullMatch = false,
    bool nullRound = false,
    bool nullPlayer = false,
    IMatch? currentMatch,
    IRound? currentRound,
    IPlayer? currentPlayer,
    GameStatus? gameStatus,
  });
}
