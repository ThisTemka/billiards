import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:billiards/entities/user/services/view/view_user_service.dart';
import 'package:riverpod/riverpod.dart';

final viewUserServiceProvider = Provider.autoDispose<IViewUserService>(
  (ref) {
    final repository = ref.watch(userRepositoryProvider);
    return ViewUserService(ref, repository);
  },
);

abstract interface class IViewUserService {
  Future<List<IUser>> getFilteredAll();
  Future<List<IUser>> getAll();
}
