import 'package:imdb/data/apis/tvs_api.dart';
import 'package:imdb/data/models/tv.dart';

class TVsRepository {
  final TVsAPI tvsAPI;

  TVsRepository(this.tvsAPI);

  Future<List<TV>> getTopRatedTVs() async {
    final tvs = await tvsAPI.getTopRatedTVs();
    return tvs.map((tv) => TV.fromJson(tv)).toList();
  }
}