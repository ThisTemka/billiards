import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/services/store/main/services/use/i_entity.dart';

abstract interface class IPlayer implements IEntity {
  IUser get user;

  int get leftBalls;
  DateTime? get startMove;
  int get currentMoveInLine;
  bool get win;

  int get moves;
  int get errorMoves;
  List<Duration> get moveDurations;
  List<int> get movesInLines;

  int get currentBalls;
  int get randomBalls;
  int get selfBalls;

  int get maxMoveInLine;
  Duration get averageMoveDuration;
  double get averageMoveInLine;
  double get accuracyMove;

  IPlayer copyWith({
    IUser? user,
    int? leftBalls,
    bool nullStartMoveTime,
    DateTime? startMove,
    int? currentMoveInLine,
    bool? win,
    int? moves,
    int? errorMoves,
    List<Duration>? moveDurations,
    List<int>? movesInLines,
    int? currentBalls,
    int? randomBalls,
  });
}
