import 'package:imdb/data/apis/search_api.dart';
import 'package:imdb/data/models/search_item.dart';

class SearchRepository {
  final SearchAPI searchAPI;

  SearchRepository(this.searchAPI);

  Future<List<SearchItem>> search(String query) async {
    final items = await searchAPI.search(query);
    return items.map((item) => SearchItem.fromJson(item)).toList();
  }
}