import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/player/repository/i_player_repository.dart';
import 'package:billiards/entities/player/services/game/game_service_service.dart';
import 'package:billiards/entities/player/services/game/i_player_turn.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:riverpod/riverpod.dart';

final gamePlayerServiceProvider =
    Provider.autoDispose<IGameServiceService>((ref) {
  final repository = ref.read(playerRepositoryProvider);
  return GameServiceService(ref, repository);
});

abstract interface class IGameServiceService {
  Future<List<IPlayer>> createPlayers(List<IUser> users);
  Future<void> turn(IPlayer player, IPlayerTurn turn);
  Future<void> turnForEnemy(IPlayer player, IPlayerTurn turn);
}
