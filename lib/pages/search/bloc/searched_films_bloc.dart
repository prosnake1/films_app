import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/models/searched_films/searchedfilm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'searched_films_event.dart';
part 'searched_films_state.dart';

class SearchedFilmsBloc extends Bloc<SearchedFilmsEvent, SearchedFilmsState> {
  SearchedFilmsBloc(this.filmsRep) : super(SearchedFilmsInitial()) {
    on<LoadFilmsList>((event, emit) async {
      try {
        await _loadList(emit);
      } catch (e, st) {
        emit(FilmsListLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  Future<void> _loadList(Emitter<SearchedFilmsState> emit) async {
    final filmsList = await filmsRep.getFilmsList();
    emit(LoadedFilmsList(films: filmsList));
  }

  final AbstractSearchedFilmsRep filmsRep;
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
