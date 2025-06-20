import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/player/entity/player.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:riverpod/riverpod.dart';

final playerFactoryProvider = Provider<IPlayerFactory>((ref) {
  return Player.create;
});

typedef IPlayerFactory = IPlayer Function({
  required IUser user,
});
