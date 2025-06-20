import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/round/repository/i_round_repository.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';

class RoundRepository implements IRoundRepository {
  final IRepository<IRound> _repository;

  RoundRepository(this._repository);

  @override
  Future<IRound?> get(int id) async => await _repository.get(id);

  @override
  Future<List<IRound>> getAll() async => await _repository.getAll();

  @override
  Future<int> add(IRound entity) async => await _repository.add(entity);

  @override
  Future<List<int>> addAll(List<IRound> entities) async =>
      await _repository.addAll(entities);

  @override
  Future<int> update(IRound entity) async => await _repository.update(entity);

  @override
  Future<bool> delete(int id) async => await _repository.delete(id);

  @override
  Future<int> clear() async => await _repository.clear();
}
