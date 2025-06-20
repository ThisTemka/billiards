import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/left_match/managers/left_match_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leftMatchManagerProvider =
    Provider.autoDispose<ILeftMatchManager>((ref) => LeftMatchManager(ref));

abstract interface class ILeftMatchManager {
  void loadState(IMatch match);
  void navigateToRound(IRound round);
}
