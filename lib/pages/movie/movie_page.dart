import 'package:cached_network_image/cached_network_image.dart';
import 'package:films_app/pages/movie/bloc/movie_info_bloc.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/repository/firebase_db/database_func.dart';
import 'package:films_app/repository/singletons/singleton.dart';
import 'package:films_app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  User? user = FirebaseAuth.instance.currentUser;
  final _filmInfoBloc = MovieInfoBloc(GetIt.I.get<AbstractMovieInfoRep>());
  @override
  void initState() {
    _filmInfoBloc.add(LoadInfoList());
    checkIfAdded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация'),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<MovieInfoBloc, MovieInfoState>(
          bloc: _filmInfoBloc,
          builder: (context, state) {
            if (state is LoadedInfoList) {
              final infoList = state.infoList[0];
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: infoList.posterUrl ?? '',
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(infoList.nameRu ?? infoList.nameOriginal ?? '',
                          style: lightTheme.textTheme.titleLarge),
                      Card(
                        color: lightTheme.cardColor,
                        child: Text(
                          infoList.ratingKinopoisk.toString(),
                          style: lightTheme.textTheme.labelSmall,
                        ),
                      )
                    ],
                  ),
                  Text(infoList.year.toString(),
                      style: lightTheme.textTheme.labelLarge),
                  Text(
                    infoList.countries!.join(', ').toString(),
                    style: lightTheme.textTheme.labelLarge,
                  ),
                  Text(
                    infoList.genres!.join(', ').toString(),
                    style: lightTheme.textTheme.labelLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          infoList.description ?? '',
                          style: lightTheme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: (GetIt.I.get<IsAddedSingleton>().isAdded == true)
          ? FloatingActionButton(
              onPressed: () async {
                await DatabaseFunctions().removeFromCollection();
                setState(() {});
              },
              child: const Icon(Icons.remove))
          : FloatingActionButton(
              onPressed: () async {
                await DatabaseFunctions().addToCollection();
                setState(() {});
              },
              child: const Icon(Icons.add),
            ),
    );
  }

  Future<void> checkIfAdded() async {
    if (user != null) {
      DatabaseReference filmRef = FirebaseDatabase.instance
          .ref()
          .child('films')
          .child(FirebaseAuth.instance.currentUser!.uid);
      filmRef.get().then((querySnapshot) {
        for (var result in querySnapshot.children) {
          if (result.children.isNotEmpty) {
            if (GetIt.I.get<MovieIdSingleton>().kinopoiskId ==
                result.child('kinopoiskId').value) {
              String addedFilmId = result.child('filmId').value.toString();
              GetIt.I.get<DbMovieId>().updateValue(addedFilmId);
              GetIt.I.get<IsAddedSingleton>().updateValue(true);
              setState(() {});
            } else {
              GetIt.I.get<IsAddedSingleton>().updateValue(false);
              setState(() {});
            }
          }
        }
      });
    }
  }
}
