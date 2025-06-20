import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/player/repository/i_player_repository.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';

class PlayerRepository implements IPlayerRepository {
  final IRepository<IPlayer> _repository;

  PlayerRepository(this._repository);

  @override
  Future<IPlayer?> get(int id) async => await _repository.get(id);

  @override
  Future<List<IPlayer>> getAll() async => await _repository.getAll();

  @override
  Future<int> add(IPlayer entity) async => await _repository.add(entity);

  @override
  Future<List<int>> addAll(List<IPlayer> entities) async =>
      await _repository.addAll(entities);

  @override
  Future<int> update(IPlayer entity) async => await _repository.update(entity);

  @override
  Future<bool> delete(int id) async => await _repository.delete(id);

  @override
  Future<int> clear() async => await _repository.clear();
}
