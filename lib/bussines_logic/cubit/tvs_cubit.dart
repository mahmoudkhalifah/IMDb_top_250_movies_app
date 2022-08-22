import 'package:bloc/bloc.dart';
import 'package:imdb/data/models/tv.dart';
import 'package:imdb/data/repositories/tvs_repository.dart';
import 'package:meta/meta.dart';

part 'tvs_state.dart';

class TVsCubit extends Cubit<TVsState> {
  TVsCubit(this.tvsRepository) : super(TVsInitial());

  final TVsRepository tvsRepository;

  Future<void> getTopRatedTVs() async {
    try {
      List<TV> tvs = await tvsRepository.getTopRatedTVs();
      emit(TVsLoaded(tvs: tvs));
    } catch (e) {
      emit(TVsLoadError(errorMsg: "Can't Load TVs"));
    }
  }
}
