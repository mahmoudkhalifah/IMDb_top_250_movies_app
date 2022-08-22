import 'package:imdb/data/apis/movies_api.dart';
import 'package:imdb/data/models/movie.dart';

class MoviesRepository {
  final MoviesAPI moviesAPI;

  MoviesRepository(this.moviesAPI);

  Future<List<Movie>> getTopRatedMovies() async {
    final movies = await moviesAPI.getTopRatedMovies();
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }
}