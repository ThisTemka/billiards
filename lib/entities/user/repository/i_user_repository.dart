import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/entity/user.dart';
import 'package:billiards/entities/user/repository/user_repository.dart';
import 'package:billiards/services/store/main/services/use/providered_wrapper/i_providered_use_store_service_wrapper.dart';
import 'package:riverpod/riverpod.dart';

final userRepositoryProvider = Provider.autoDispose<IUserRepository>((ref) {
  final store = ref.read(provideredUseStoreServiceProvider);
  final repository = store.getProvideredRepository<User>(ref);
  return UserRepository(repository);
});

abstract interface class IUserRepository {
  Future<IUser?> get(int id);
  Future<List<IUser>> getAll();
  Future<int> add(IUser user);
  Future<List<int>> addAll(List<IUser> users);
  Future<int> update(IUser user);
  Future<bool> delete(int id);
  Future<int> clear();
}
