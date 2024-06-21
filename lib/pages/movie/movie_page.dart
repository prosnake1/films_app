import 'package:dio/dio.dart';
import 'package:films_app/repository/dio/movie_rep.dart';
import 'package:films_app/repository/models/movie_info/movie.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<MovieInfo>? movieInfo;
  @override
  void initState() {
    getMovieInfoList();
    super.initState();
  }

  Future<void> getMovieInfoList() async {
    movieInfo = await MovieInfoRepository(dio: Dio()).getMovieInfoList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация'),
      ),
      body: (movieInfo == null) ? SizedBox() : Text(movieInfo![0].nameOriginal),
    );
  }
}
