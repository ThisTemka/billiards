import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:billiards/services/store/main/services/use/i_repository.dart';

class UserRepository implements IUserRepository {
  final IRepository<IUser> _repository;

  UserRepository(this._repository);

  @override
  Future<IUser?> get(int id) async => await _repository.get(id);

  @override
  Future<List<IUser>> getAll() async => await _repository.getAll();

  @override
  Future<int> add(IUser entity) async => await _repository.add(entity);

  @override
  Future<List<int>> addAll(List<IUser> entities) async =>
      await _repository.addAll(entities);

  @override
  Future<int> update(IUser entity) async => await _repository.update(entity);

  @override
  Future<bool> delete(int id) async => await _repository.delete(id);

  @override
  Future<int> clear() async => await _repository.clear();
}
