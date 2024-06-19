import 'package:films_app/repository/models/top_films/topfilms.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';

class Films extends StatefulWidget {
  const Films({
    super.key,
    required this.films,
  });

  final List<TopFilms> films;

  @override
  State<Films> createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 30,
        ),
        itemCount: widget.films.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          final film = widget.films[i];
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
    );
  }
}
