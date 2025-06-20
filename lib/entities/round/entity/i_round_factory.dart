import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/round/entity/round.dart';
import 'package:riverpod/riverpod.dart';

final roundFactoryProvider = Provider.autoDispose<IRoundFactory>((ref) {
  return Round.create;
});

typedef IRoundFactory = IRound Function({
  required List<IPlayer> players,
  required DateTime start,
});
