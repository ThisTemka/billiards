import 'package:billiards/entities/player/entity/i_player.dart';
import 'package:billiards/entities/player/entity/player.dart';
import 'package:billiards/entities/round/entity/i_round.dart';
import 'package:billiards/services/store/main/services/use/i_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Round implements IEntity, IRound {
  @override
  late int id;

  @override
  @Transient()
  List<IPlayer> get players => rplayers;
  final ToMany<Player> rplayers;

  @override
  final DateTime start;

  @override
  final DateTime? end;

  Round({
    required this.id,
    required this.rplayers,
    required this.start,
    required this.end,
  });

  Round.create({
    this.id = 0,
    required List<IPlayer> players,
    required this.start,
    this.end,
  }) : rplayers =
            ToMany(items: players.map((player) => player as Player).toList());

  @override
  IRound copyWith({
    List<IPlayer>? players,
    DateTime? start,
    bool nullEnd = false,
    DateTime? end,
  }) {
    return Round.create(
      id: id,
      players: players ?? this.players,
      start: start ?? this.start,
      end: nullEnd ? null : end ?? this.end,
    );
  }
}
