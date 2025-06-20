import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/services/store/main/services/use/i_entity.dart';

abstract interface class IMatch implements IEntity {
  List<IRound> get rounds;
  List<IUser> get users;
  DateTime get start;
  DateTime? get end;

  int get firstPlayerWins;
  int get secondPlayerWins;
  int get firstPlayerSelfBalls;
  int get secondPlayerSelfBalls;
  double get firstPlayerAccuracy;
  double get secondPlayerAccuracy;
  int get firstPlayerMaxMoveInLine;
  int get secondPlayerMaxMoveInLine;
  double get firstPlayerAverageMoveInLine;
  double get secondPlayerAverageMoveInLine;
  Duration get firstPlayerAverageMoveDuration;
  Duration get secondPlayerAverageMoveDuration;
  int get firstPlayerErrorMove;
  int get secondPlayerErrorMove;

  IMatch copyWith({
    List<IRound>? rounds,
    List<IUser>? users,
    DateTime? start,
    bool nullEnd,
    DateTime? end,
  });
}
