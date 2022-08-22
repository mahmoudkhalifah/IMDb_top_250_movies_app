import 'package:bloc/bloc.dart';
import 'package:imdb/data/models/movie.dart';
import 'package:imdb/data/repositories/movies_repostiory.dart';
import 'package:meta/meta.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.movieRepository) : super(MoviesInitial());

  final MoviesRepository movieRepository;

  Future<void> getTopRatedMovies() async {
    try {
      List<Movie> movies = await movieRepository.getTopRatedMovies();
      emit(MoviesLoaded(movies: movies));
    } catch (e) {
      emit(MoviesLoadError(errorMsg: "Can't Load Movies"));
    }
  }
}
