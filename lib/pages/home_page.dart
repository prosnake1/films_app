import 'package:films_app/repository/dio/api.dart';
import 'package:films_app/repository/models/top_films/topfilms.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TopFilms> films = [];
  @override
  void initState() {
    getList();
    super.initState();
  }

  void getList() async {
    films = await ApiService().getTopFilmsList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Главная страница',
          style: lightTheme.textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 30,
              ),
              itemCount: films.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                final film = films[i];
                return SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 8,
                        child: Center(
                            child: Text('${i + 1}',
                                style: lightTheme.textTheme.labelLarge)),
                      ),
                      Image.network(
                        film.posterUrl,
                        width: MediaQuery.of(context).size.width / 3.5,
                        height: MediaQuery.of(context).size.height / 5,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              film.nameRu ?? 'No Name',
                              style: lightTheme.textTheme.labelLarge,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(film.year.toString(),
                                style: lightTheme.textTheme.labelLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 300,
          )
        ],
      ),
    );
  }
}
