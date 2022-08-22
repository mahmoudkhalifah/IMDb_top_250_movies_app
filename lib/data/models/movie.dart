import 'package:imdb/data/models/imdb_item.dart';

class Movie extends ImdbItem {
  Movie.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}