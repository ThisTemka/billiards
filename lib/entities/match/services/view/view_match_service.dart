import 'package:billiards/entities/match/entity/i_match.dart';
import 'package:billiards/entities/match/repository/i_match_repository.dart';
import 'package:billiards/entities/match/services/view/i_view_match_service.dart';

class ViewMatchService implements IViewMatchService {
  final IMatchRepository _repository;

  ViewMatchService(this._repository);

  Future<List<IMatch>> get matches async => await _repository.getAll();

  @override
  Future<List<IMatch>> getSortedMatches() async {
    return (await matches)
        .where((match) => match.end != null && match.users.length == 2)
        .toList()
      ..sort((a, b) => b.start.compareTo(a.start));
  }
}
