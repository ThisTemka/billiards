import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/entities/round/entity/round.dart';
import 'package:billiards/entities/user/entity/i_user.dart';
import 'package:billiards/entities/user/entity/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Match implements IMatch {
  @override
  late int id;

  @override
  @Transient()
  List<IUser> get users => rusers.toList();
  final ToMany<User> rusers;

  @override
  @Transient()
  List<IRound> get rounds => rrounds.toList();
  final ToMany<Round> rrounds;

  @override
  final DateTime start;

  @override
  final DateTime? end;

  @override
  @Transient()
  int get firstPlayerWins =>
      rounds.fold(0, (a, b) => a + (b.players[0].win ? 1 : 0));
  @override
  @Transient()
  int get secondPlayerWins =>
      rounds.fold(0, (a, b) => a + (b.players[1].win ? 1 : 0));
  @override
  @Transient()
  int get firstPlayerSelfBalls =>
      rounds.fold(0, (a, b) => a + b.players[0].selfBalls);
  @override
  @Transient()
  int get secondPlayerSelfBalls =>
      rounds.fold(0, (a, b) => a + b.players[1].selfBalls);
  @override
  @Transient()
  double get firstPlayerAccuracy =>
      rounds.fold(0, (a, b) => a + b.players[0].currentBalls) /
      (rounds.every((round) => round.players[0].moves == 0)
          ? 1
          : rounds.fold(0, (a, b) => a + b.players[0].moves));
  @override
  @Transient()
  double get secondPlayerAccuracy =>
      rounds.fold(0, (a, b) => a + b.players[1].currentBalls) /
      (rounds.every((round) => round.players[1].moves == 0)
          ? 1
          : rounds.fold(0, (a, b) => a + b.players[1].moves));
  @override
  @Transient()
  int get firstPlayerMaxMoveInLine => rounds.fold(
      0,
      (a, b) =>
          a > b.players[0].maxMoveInLine ? a : b.players[0].maxMoveInLine);
  @override
  @Transient()
  int get secondPlayerMaxMoveInLine => rounds.fold(
      0,
      (a, b) =>
          a > b.players[1].maxMoveInLine ? a : b.players[1].maxMoveInLine);
  @override
  @Transient()
  double get firstPlayerAverageMoveInLine =>
      rounds.fold(
          0, (a, b) => a + b.players[0].movesInLines.fold(0, (a, b) => a + b)) /
      (rounds.every((round) => round.players[0].movesInLines.isEmpty)
          ? 1
          : rounds.fold(0, (a, b) => a + b.players[0].movesInLines.length));
  @override
  @Transient()
  double get secondPlayerAverageMoveInLine =>
      rounds.fold(
          0, (a, b) => a + b.players[1].movesInLines.fold(0, (a, b) => a + b)) /
      (rounds.every((round) => round.players[1].movesInLines.isEmpty)
          ? 1
          : rounds.fold(0, (a, b) => a + b.players[1].movesInLines.length));
  @override
  @Transient()
  Duration get firstPlayerAverageMoveDuration => Duration(
      seconds: (rounds.fold(
                  0,
                  (a, b) =>
                      a +
                      b.players[0].moveDurations
                          .fold(0, (a, b) => a + b.inSeconds)) /
              (rounds.every((round) => round.players[0].moveDurations.isEmpty)
                  ? 1
                  : rounds.fold(
                      0, (a, b) => a + b.players[0].moveDurations.length)))
          .toInt());
  @override
  @Transient()
  Duration get secondPlayerAverageMoveDuration => Duration(
      seconds: (rounds.fold(
                  0,
                  (a, b) =>
                      a +
                      b.players[1].moveDurations
                          .fold(0, (a, b) => a + b.inSeconds)) /
              (rounds.every((round) => round.players[1].moveDurations.isEmpty)
                  ? 1
                  : rounds.fold(
                      0, (a, b) => a + b.players[1].moveDurations.length)))
          .toInt());
  @override
  @Transient()
  int get firstPlayerErrorMove =>
      rounds.fold(0, (a, b) => a + b.players[0].errorMoves);
  @override
  @Transient()
  int get secondPlayerErrorMove =>
      rounds.fold(0, (a, b) => a + b.players[1].errorMoves);

  Match({
    required this.id,
    required this.rrounds,
    required this.rusers,
    required this.start,
    required this.end,
  });

  Match.create({
    this.id = 0,
    required List<IUser> users,
    required this.start,
    List<IRound> rounds = const [],
    this.end,
  })  : rrounds = ToMany(items: rounds.map((round) => round as Round).toList()),
        rusers = ToMany(items: users.map((user) => user as User).toList());

  @override
  IMatch copyWith({
    List<IRound>? rounds,
    List<IUser>? users,
    DateTime? start,
    bool nullEnd = false,
    DateTime? end,
  }) {
    return Match.create(
      id: id,
      rounds: rounds ?? this.rounds,
      users: users ?? this.users,
      start: start ?? this.start,
      end: nullEnd ? null : end ?? this.end,
    );
  }
}
