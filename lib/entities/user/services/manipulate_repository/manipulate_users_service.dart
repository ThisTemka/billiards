import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/entity/i_user_factory.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:billiards/entities/user/services/manipulate_repository/i_manipulate_users_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManipulateUsersService implements IManipulateUsersService {
  final Ref ref;
  final IUserRepository repository;

  ManipulateUsersService(this.ref, this.repository);

  IUserFactory get factory => ref.read(userFactoryProvider);

  @override
  Future<IUser> createUser(String name) async {
    final user = factory(name: name);
    await repository.add(user);
    return user;
  }

  @override
  Future<bool> deleteUser(IUser user) async {
    return await repository.delete(user.id);
  }
}
