import 'package:cached_network_image/cached_network_image.dart';
import 'package:films_app/repository/models/movie_info/movie.dart';
import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.infoList,
  });

  final MovieInfo infoList;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CachedNetworkImage(
        imageUrl: infoList.posterUrl ?? '',
        width: MediaQuery.of(context).size.width / 2,
      ),
    );
  }
}
