part of 'tvs_cubit.dart';

@immutable
abstract class TVsState {}

class TVsInitial extends TVsState {}

class TVsLoaded extends TVsState {
  final List<TV> tvs;

  TVsLoaded({required this.tvs});
}

class TVsLoadError extends TVsState {
  final String errorMsg;

  TVsLoadError({required this.errorMsg});

}