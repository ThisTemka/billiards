import 'package:billiards/entities/game_state/services/match/i_match_game_state_service.dart';
import 'package:billiards/entities/game_state/services/player/i_player_game_state_service.dart';
import 'package:billiards/entities/game_state/services/round/i_round_game_state_service.dart';
import 'package:billiards/entities/game_state/services/view/i_view_game_state_service.dart';
import 'package:billiards/entities/match/services/game/i_game_match_service.dart';
import 'package:billiards/entities/match/services/manipulate_repository/i_manipulate_matches_service.dart';
import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/player/services/game/i_game_service_service.dart';
import 'package:billiards/entities/round/services/game/i_game_round_service.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/services/game/i_game_user_service.dart';
import 'package:billiards/managers/manipulate_game/game_turn.dart';
import 'package:billiards/managers/manipulate_game/i_manipulate_game_manager.dart';
import 'package:billiards/managers/manipulate_game/i_turn.dart';
import 'package:riverpod/riverpod.dart';

class ManipulateGameManager implements IManipulateGameManager {
  final Ref ref;

  ManipulateGameManager(this.ref);

  IViewGameStateService get viewGameState =>
      ref.read(viewGameStateServiceProvider);
  IMatchGameStateService get matchGameState =>
      ref.read(matchGameStateServiceProvider);
  IRoundGameStateService get roundGameState =>
      ref.read(roundGameStateServiceProvider);
  IPlayerGameStateService get playerGameState =>
      ref.read(playerGameStateServiceProvider);

  IGameServiceService get gamePlayer => ref.read(gamePlayerServiceProvider);
  IGameUserService get gameUser => ref.read(gameUserServiceProvider);
  IGameRoundService get gameRound => ref.read(gameRoundServiceProvider);
  IGameMatchService get gameMatch => ref.read(gameMatchServiceProvider);

  IManipulateMatchesService get manipulateMatches =>
      ref.read(manipulateMatchesServiceProvider);

  @override
  Future<void> openMatch(List<IUser> users) async {
    final match = await manipulateMatches.createMatch(users);
    await matchGameState.startMatch(match);
  }

  @override
  Future<void> openRound() async {
    final match = await viewGameState.getCurrentMatch();
    final players = await gamePlayer.createPlayers(match!.users);
    final round = await gameRound.startRound(players);
    await gameMatch.addRound(match, round);
    await roundGameState.startRound(round);
  }

  @override
  Future<void> nextRound() async {
    final match = await viewGameState.getCurrentMatch();
    final players = await gamePlayer.createPlayers(match!.users);
    final round = await gameRound.startRound(players);
    await gameMatch.addRound(match, round);
    await roundGameState.nextRound(round);
  }

  @override
  Future<void> selectPlayer(IPlayer player) async {
    await playerGameState.selectPlayer(player);
  }

  @override
  Future<void> completeTurn(ITurn turn) async {
    final round = await viewGameState.getCurrentRound();
    final player = await viewGameState.getCurrentPlayer();
    final enemy = round!.players.firstWhere((p) => p.id != player!.id);

    final gameTurn = GameTurn(
      currentBalls: turn.currentBalls,
      randomBalls: turn.randomBalls,
      enemyBalls: turn.enemyBalls,
      whiteBall: turn.whiteBall,
      blackBall: turn.blackBall,
      isLoseMove: (turn.whiteBall &&
              player!.leftBalls == turn.currentBalls + turn.randomBalls) ||
          turn.blackBall,
      isScoreMove: !turn.whiteBall &&
          !turn.blackBall &&
          !turn.tableExit &&
          turn.currentBalls + turn.randomBalls > 0 &&
          turn.touchBall,
      isErrorMove: turn.whiteBall &&
          turn.blackBall &&
          turn.tableExit &&
          (turn.currentBalls + turn.randomBalls == 0 || !turn.touchBall),
      isSimpleMove: !turn.whiteBall &&
          !turn.blackBall &&
          !turn.tableExit &&
          turn.currentBalls + turn.randomBalls == 0 &&
          turn.touchBall,
      isWin: player!.leftBalls == turn.currentBalls + turn.randomBalls &&
          !turn.blackBall,
      isLose: (turn.whiteBall &&
              player.leftBalls == turn.currentBalls + turn.randomBalls) ||
          turn.blackBall,
      moveDuration: DateTime.now().difference(player.startMove!),
      currentMoveInLine: player.currentMoveInLine +
          (!turn.whiteBall &&
                  !turn.blackBall &&
                  !turn.tableExit &&
                  turn.currentBalls + turn.randomBalls > 0 &&
                  turn.touchBall
              ? 1
              : 0),
    );

    await (gamePlayer).turn(player, gameTurn);
    await (gameUser).turn(player.user, gameTurn);

    await (gamePlayer).turnForEnemy(enemy, gameTurn);
    await (gameUser).turnForEnemy(enemy.user, gameTurn);
  }

  @override
  Future<void> closeRound() async {
    final round = await viewGameState.getCurrentRound();

    await gameRound.endRound(round!);
    await roundGameState.endRound();
  }

  @override
  Future<void> closeMatch() async {
    final match = await viewGameState.getCurrentMatch();

    await gameMatch.endMatch(match!);
    await matchGameState.endMatch();
  }
}
