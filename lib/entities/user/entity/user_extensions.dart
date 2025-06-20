import 'package:billiards/entities/user/entity/i_user.dart';

extension UserExtensions on IUser {
  double get accuracyMove => moves > 0 ? currentBalls / moves : 0;
  double get averageMovesInLine => movesInLines.isNotEmpty
      ? movesInLines.reduce((a, b) => a + b) / movesInLines.length
      : 0;
  Duration get averageMoveDuration => moveDurations.isNotEmpty
      ? Duration(
          seconds: moveDurations.reduce((a, b) => a + b).inSeconds ~/
              moveDurations.length)
      : Duration.zero;
}
