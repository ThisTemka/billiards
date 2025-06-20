import 'package:billiards/services/store/main/services/use/i_entity.dart';

abstract interface class IRepository<T extends IEntity> {
  Future<T?> get(int id);
  Future<List<T>> getAll();
  Future<int> add(T entity);
  Future<List<int>> addAll(List<T> entities);
  Future<int> update(T entity);
  Future<bool> delete(int id);
  Future<int> clear();
}
