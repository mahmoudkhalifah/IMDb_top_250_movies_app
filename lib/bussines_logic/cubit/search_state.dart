// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchDataLoading extends SearchState {}

class SearchDataLoaded extends SearchState {
  final List<SearchItem> items;
  SearchDataLoaded({
    required this.items,
  });
}

class SearchDataNotFound extends SearchState {}

class SearchError extends SearchState {}
