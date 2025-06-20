import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:billiards/entities/user/services/manipulate_repository/manipulate_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateUsersServiceProvider =
    Provider.autoDispose<IManipulateUsersService>((ref) {
  final repository = ref.read(userRepositoryProvider);
  return ManipulateUsersService(ref, repository);
});

abstract interface class IManipulateUsersService {
  Future<IUser> createUser(String name);
  Future<bool> deleteUser(IUser user);
}
