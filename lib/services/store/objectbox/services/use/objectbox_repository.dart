import 'package:billiards/services/store/main/services/use/i_entity.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';
import 'package:objectbox/objectbox.dart';

class ObjectboxRepository<T extends IEntity> implements IRepository<T> {
  final Box<T> _box;

  ObjectboxRepository(this._box);

  @override
  Future<int> add(T entity) async => await _box.putAsync(entity);

  @override
  Future<List<int>> addAll(List<T> entities) async =>
      await _box.putManyAsync(entities);

  @override
  Future<int> clear() async => _box.removeAllAsync();

  @override
  Future<bool> delete(int id) async => _box.removeAsync(id);

  @override
  Future<T?> get(int id) async => _box.get(id);

  @override
  Future<List<T>> getAll() async => await _box.getAllAsync();

  @override
  Future<int> update(T entity) async =>
      await _box.putAsync(entity, mode: PutMode.update);
}
