import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/models/top_films/topfilms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_films_event.dart';
part 'top_films_state.dart';

class TopFilmsBloc extends Bloc<TopFilmsEvent, TopFilmsState> {
  TopFilmsBloc(this.topFilmsRep) : super(TopFilmsInitial()) {
    on<LoadFilmsEvent>((event, emit) async {
      final filmsList = await topFilmsRep.getTopFilmsList();
      emit(FilmsListLoaded(filmsList: filmsList));
    });
  }
  final AbstractTopFilmsRep topFilmsRep;
}
