import 'package:bloc/bloc.dart';
import 'package:imdb/data/models/search_item.dart';
import 'package:imdb/data/repositories/search_repository.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;
  SearchCubit(this.searchRepository) : super(SearchInitial());

  void search(String query) async {
    emit(SearchDataLoading());
    try {
      List<SearchItem> items;
      items = await searchRepository.search(query);
      if (items.isEmpty) {
        emit(SearchDataNotFound());
      } else {
        emit(SearchDataLoaded(items: items));
      }
    } catch (e) {
      emit(SearchError());
    }
  }
}
