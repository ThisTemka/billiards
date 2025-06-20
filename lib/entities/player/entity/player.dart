import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/entity/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Player implements IPlayer {
  @override
  late int id;

  @override
  @Transient()
  IUser get user => ruser.target!;
  final ToOne<User> ruser;

  @override
  final int leftBalls;

  @override
  final DateTime? startMove;

  @override
  final int currentMoveInLine;

  @override
  final bool win;

  @override
  final int moves;
  @override
  final int errorMoves;

  @override
  @Transient()
  List<Duration> get moveDurations =>
      moveDurationsInSeconds.map((e) => Duration(seconds: e)).toList();
  final List<int> moveDurationsInSeconds;

  @override
  final List<int> movesInLines;

  @override
  final int currentBalls;
  @override
  final int randomBalls;
  @override
  @Transient()
  int get selfBalls => currentBalls + randomBalls;

  @override
  @Transient()
  int get maxMoveInLine => movesInLines.isNotEmpty
      ? movesInLines.reduce((a, b) => a > b ? a : b)
      : 0;

  @override
  @Transient()
  Duration get averageMoveDuration => moveDurations.isNotEmpty
      ? Duration(
          seconds: moveDurations.reduce((a, b) => a + b).inSeconds ~/
              moveDurations.length)
      : Duration.zero;

  @override
  @Transient()
  double get averageMoveInLine => movesInLines.isNotEmpty
      ? movesInLines.reduce((a, b) => a + b) / movesInLines.length
      : 0;

  @override
  @Transient()
  double get accuracyMove => moves > 0 ? currentBalls / moves : 0;

  Player({
    required this.id,
    required this.ruser,
    required this.leftBalls,
    required this.startMove,
    required this.currentMoveInLine,
    required this.win,
    required this.moves,
    required this.errorMoves,
    required this.moveDurationsInSeconds,
    required this.movesInLines,
    required this.currentBalls,
    required this.randomBalls,
  });

  @Transient()
  Player.create({
    this.id = 0,
    required IUser user,
    this.leftBalls = 8,
    this.startMove,
    this.currentMoveInLine = 0,
    this.win = false,
    this.moves = 0,
    this.errorMoves = 0,
    List<Duration>? moveDurations,
    this.movesInLines = const [],
    this.currentBalls = 0,
    this.randomBalls = 0,
  })  : ruser = ToOne(target: user as User),
        moveDurationsInSeconds =
            moveDurations?.map((e) => e.inSeconds).toList() ?? [];

  @override
  IPlayer copyWith({
    IUser? user,
    int? leftBalls,
    bool nullStartMoveTime = false,
    DateTime? startMove,
    int? currentMoveInLine,
    bool? win,
    int? moves,
    int? errorMoves,
    List<Duration>? moveDurations,
    List<int>? movesInLines,
    int? currentBalls,
    int? randomBalls,
  }) {
    return Player.create(
      id: id,
      user: user ?? this.user,
      leftBalls: leftBalls ?? this.leftBalls,
      startMove: nullStartMoveTime ? null : startMove ?? this.startMove,
      currentMoveInLine: currentMoveInLine ?? this.currentMoveInLine,
      win: win ?? this.win,
      moves: moves ?? this.moves,
      moveDurations: moveDurations ?? this.moveDurations,
      movesInLines: movesInLines ?? this.movesInLines,
      currentBalls: currentBalls ?? this.currentBalls,
      randomBalls: randomBalls ?? this.randomBalls,
    );
  }
}
