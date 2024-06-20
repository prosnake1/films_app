part of 'searched_films_bloc.dart';

abstract class SearchedFilmsState {}

class SearchedFilmsInitial extends SearchedFilmsState {}

class LoadedFilmsList extends SearchedFilmsState {
  LoadedFilmsList({required this.films});
  final List<SearchedFilms> films;
}
