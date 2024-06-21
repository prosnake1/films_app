part of 'movie_info_bloc.dart';

abstract class MovieInfoState {}

class MovieInfoInitial extends MovieInfoState {}

class LoadedInfoList extends MovieInfoState {
  LoadedInfoList({required this.infoList});
  final List<MovieInfo> infoList;
}
