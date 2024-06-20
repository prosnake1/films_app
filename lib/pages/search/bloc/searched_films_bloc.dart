import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/models/searched_films/searchedfilms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searched_films_event.dart';
part 'searched_films_state.dart';

class SearchedFilmsBloc extends Bloc<SearchedFilmsEvent, SearchedFilmsState> {
  SearchedFilmsBloc(this.filmsRep) : super(SearchedFilmsInitial()) {
    on<LoadFilmsList>((event, emit) async {
      final filmsList = await filmsRep.getFilmsList();
      emit(LoadedFilmsList(films: filmsList));
    });
  }
  final AbstractSearchedFilmsRep filmsRep;
}
