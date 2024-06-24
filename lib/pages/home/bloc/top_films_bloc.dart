import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/models/top_films/film.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'top_films_event.dart';
part 'top_films_state.dart';

class TopFilmsBloc extends Bloc<TopFilmsEvent, TopFilmsState> {
  TopFilmsBloc(this.topFilmsRep) : super(TopFilmsInitial()) {
    on<LoadFilmsEvent>((event, emit) async {
      await _load(emit);
    });
  }

  Future<void> _load(Emitter<TopFilmsState> emit) async {
    try {
      final filmsList = await topFilmsRep.getTopFilmsList();
      emit(FilmsListLoaded(filmsList: filmsList));
    } catch (e, st) {
      emit(FilmsListLoadingFailure(exception: e));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  final AbstractTopFilmsRep topFilmsRep;
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
