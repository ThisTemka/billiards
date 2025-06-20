import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/pages/left_round/managers/left_round_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leftRoundManagerProvider =
    Provider.autoDispose<ILeftRoundManager>((ref) => LeftRoundManager(ref));

abstract interface class ILeftRoundManager {
  void loadState(IRound round, int roundIndex);
  void navigateToBack();
}
