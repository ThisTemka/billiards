import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/repository/i_match_repository.dart';
import 'package:billiards/entities/match/services/manipulate_repository/manipulate_matches_service.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateMatchesServiceProvider =
    Provider.autoDispose<IManipulateMatchesService>((ref) {
  final repository = ref.read(matchRepositoryProvider);
  return ManipulateMatchesService(ref, repository);
});

abstract interface class IManipulateMatchesService {
  Future<void> deleteMatch(IMatch match);
  Future<IMatch> createMatch(List<IUser> users);
}
