import 'package:imdb/data/apis/movie_api.dart';
import 'package:imdb/data/models/movie.dart';

class MovieRepository {
  final MovieAPI movieAPI;

  MovieRepository(this.movieAPI);

  Future<List<Movie>> getTopRatedMovies() async {
    final movies = await movieAPI.getTopRatedMovies();
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }
}