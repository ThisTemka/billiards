import 'package:billiards/entities/game_state/entity/game_status.dart';
import 'package:billiards/entities/game_state/entity/i_game_state.dart';
import 'package:billiards/entities/game_state/repository/i_game_state_repository.dart';
import 'package:billiards/entities/game_state/repository/i_tooling_game_state_repository.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';

class GameStateRepository
    implements IGameStateRepository, IToolingGameStateRepository {
  final IRepository<IGameState> _repository;

  GameStateRepository(this._repository);

  @override
  Future<bool> has() async => (await _repository.getAll()).isNotEmpty;

  @override
  Future<int> add(IGameState gameState) async =>
      await _repository.add(gameState);

  @override
  Future<IGameState> get() async => (await _repository.getAll()).first;

  @override
  Future<int> update(IGameState gameState) async =>
      await _repository.update(gameState);

  @override
  Future<int> reset() async {
    final entity = await get();
    final resetedEntity = _resetEntity(entity);
    return await update(resetedEntity);
  }

  IGameState _resetEntity(IGameState gameState) => gameState.copyWith(
        currentMatch: null,
        currentRound: null,
        currentPlayer: null,
        gameStatus: GameStatus.selectPlayer,
      );
}
