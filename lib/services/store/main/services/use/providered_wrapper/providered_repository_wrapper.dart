import 'package:billiards/services/store/main/services/use/i_entity.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProvideredRepositoryWrapper<T extends IEntity> implements IRepository<T> {
  final Ref ref;
  final IRepository<T> _repository;

  ProvideredRepositoryWrapper(this.ref, this._repository);

  @override
  Future<T?> get(int id) async {
    return _repository.get(id);
  }

  @override
  Future<List<T>> getAll() async {
    return _repository.getAll();
  }

  @override
  Future<int> add(T entity) async {
    final id = await _repository.add(entity);
    ref.invalidateSelf();
    return id;
  }

  @override
  Future<List<int>> addAll(List<T> entities) async {
    final ids = await _repository.addAll(entities);
    ref.invalidateSelf();
    return ids;
  }

  @override
  Future<int> update(T entity) async {
    final id = await _repository.update(entity);
    ref.invalidateSelf();
    return id;
  }

  @override
  Future<bool> delete(int id) async {
    final result = await _repository.delete(id);
    ref.invalidateSelf();
    return result;
  }

  @override
  Future<int> clear() async {
    final count = await _repository.clear();
    ref.invalidateSelf();
    return count;
  }
}
