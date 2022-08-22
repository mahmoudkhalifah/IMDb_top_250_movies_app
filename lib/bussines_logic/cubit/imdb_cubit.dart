import 'package:bloc/bloc.dart';
import 'package:imdb/bussines_logic/cubit/movies_cubit.dart';
import 'package:imdb/bussines_logic/cubit/tvs_cubit.dart';
import 'package:imdb/data/apis/movies_api.dart';
import 'package:imdb/data/apis/tvs_api.dart';
import 'package:imdb/data/repositories/movies_repostiory.dart';
import 'package:imdb/data/repositories/tvs_repository.dart';
import 'package:meta/meta.dart';

part 'imdb_state.dart';

class ImdbCubit extends Cubit<ImdbState> {
  late MoviesCubit moviesCubit;
  late TVsCubit tvsCubit;
  
  ImdbCubit() : super(ImdbInitial()) {
    moviesCubit = MoviesCubit(MoviesRepository(MoviesAPI()));
    tvsCubit = TVsCubit(TVsRepository(TVsAPI()));
  }
}
