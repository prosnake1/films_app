import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/models/movie_info/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
part 'movie_info_event.dart';
part 'movie_info_state.dart';

class MovieInfoBloc extends Bloc<MovieInfoEvent, MovieInfoState> {
  MovieInfoBloc(this.movieInfoRep) : super(MovieInfoInitial()) {
    on<LoadInfoList>((event, emit) async {
      try {
        await _loadList(emit);
      } catch (e, st) {
        emit(InfoListLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  Future<void> _loadList(Emitter<MovieInfoState> emit) async {
    final infoList = await movieInfoRep.getMovieInfoList();
    emit(LoadedInfoList(infoList: infoList));
  }

  final AbstractMovieInfoRep movieInfoRep;
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
