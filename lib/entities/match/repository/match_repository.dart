import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/repository/i_match_repository.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';

class MatchRepository implements IMatchRepository {
  final IRepository<IMatch> _repository;

  MatchRepository(this._repository);

  @override
  Future<IMatch?> get(int id) async => await _repository.get(id);

  @override
  Future<List<IMatch>> getAll() async => await _repository.getAll();

  @override
  Future<int> add(IMatch entity) async => await _repository.add(entity);

  @override
  Future<List<int>> addAll(List<IMatch> entities) async =>
      await _repository.addAll(entities);

  @override
  Future<int> update(IMatch entity) async => await _repository.update(entity);

  @override
  Future<bool> delete(int id) async => await _repository.delete(id);

  @override
  Future<int> clear() async => await _repository.clear();
}
