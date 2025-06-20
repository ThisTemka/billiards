import 'package:billiards/entities/game_state/entity/game_status.dart';
import 'package:billiards/entities/game_state/entity/i_game_state.dart';
import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/entity/match.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/player/entity/player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/round/entity/round.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class GameState implements IGameState {
  @override
  late int id;

  @override
  @Transient()
  IMatch? get currentMatch => rcurrentMatch.target;
  final ToOne<Match> rcurrentMatch;

  @override
  @Transient()
  IRound? get currentRound => rcurrentRound.target;
  final ToOne<Round> rcurrentRound;

  @override
  @Transient()
  IPlayer? get currentPlayer => rcurrentPlayer.target;
  final ToOne<Player> rcurrentPlayer;

  @override
  @Transient()
  GameStatus get gameStatus => GameStatus.values[gameStatusIndex];
  final int gameStatusIndex;

  GameState({
    required this.id,
    required this.rcurrentMatch,
    required this.rcurrentRound,
    required this.rcurrentPlayer,
    required this.gameStatusIndex,
  });

  GameState.create({
    this.id = 0,
    IMatch? currentMatch,
    IRound? currentRound,
    IPlayer? currentPlayer,
    GameStatus gameStatus = GameStatus.selectPlayer,
  })  : rcurrentMatch = ToOne<Match>(target: currentMatch as Match?),
        rcurrentRound = ToOne<Round>(target: currentRound as Round?),
        rcurrentPlayer = ToOne<Player>(target: currentPlayer as Player?),
        gameStatusIndex = gameStatus.index;

  @override
  IGameState copyWith({
    bool nullMatch = false,
    IMatch? currentMatch,
    bool nullRound = false,
    IRound? currentRound,
    bool nullPlayer = false,
    IPlayer? currentPlayer,
    GameStatus? gameStatus,
  }) {
    return GameState.create(
      id: id,
      currentMatch: nullMatch ? null : currentMatch ?? this.currentMatch,
      currentRound: nullRound ? null : currentRound ?? this.currentRound,
      currentPlayer: nullPlayer ? null : currentPlayer ?? this.currentPlayer,
      gameStatus: gameStatus ?? this.gameStatus,
    );
  }
}
