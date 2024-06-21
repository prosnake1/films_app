import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/models/movie_info/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movie_info_event.dart';
part 'movie_info_state.dart';

class MovieInfoBloc extends Bloc<MovieInfoEvent, MovieInfoState> {
  MovieInfoBloc(this.movieInfoRep) : super(MovieInfoInitial()) {
    on<LoadInfoList>((event, emit) async {
      final infoList = await movieInfoRep.getMovieInfoList();
      emit(LoadedInfoList(infoList: infoList));
    });
  }
  final AbstractMovieInfoRep movieInfoRep;
}
