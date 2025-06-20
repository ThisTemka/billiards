import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/entity/match.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:riverpod/riverpod.dart';

final matchFactoryProvider = Provider.autoDispose<IMatchFactory>((ref) {
  return Match.create;
});

typedef IMatchFactory = IMatch Function({
  required List<IUser> users,
  required DateTime start,
});
