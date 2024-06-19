part of 'top_films_bloc.dart';

abstract class TopFilmsState {}

class TopFilmsInitial extends TopFilmsState {}

class FilmsListLoaded extends TopFilmsState {
  FilmsListLoaded({required this.filmsList});
  final List<TopFilms> filmsList;
}
