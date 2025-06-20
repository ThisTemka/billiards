import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/repository/i_user_repository.dart';
import 'package:billiards/entities/user/services/view/i_view_user_service.dart';
import 'package:billiards/entities/user/entity/user_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewUserService implements IViewUserService {
  final Ref ref;
  final IUserRepository repository;
  ViewUserService(this.ref, this.repository);

  Future<List<IUser>> get users async => await repository.getAll();

  @override
  Future<List<IUser>> getFilteredAll() async {
    return (await users)..sort((a, b) => _ratingCompareTo(a, b));
  }

  int _ratingCompareTo(IUser user, IUser other) {
    if (user.roundWins != other.roundWins) {
      return other.roundWins.compareTo(user.roundWins);
    }
    if (user.accuracyMove != other.accuracyMove) {
      return other.accuracyMove.compareTo(user.accuracyMove);
    }
    if (user.averageMovesInLine != other.averageMovesInLine) {
      return other.averageMovesInLine.compareTo(user.averageMovesInLine);
    }
    return 0;
  }

  @override
  Future<List<IUser>> getAll() async {
    return await users;
  }
}
