import 'package:films_app/repository/singletons/singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

class DatabaseFunctions {
  User? user = FirebaseAuth.instance.currentUser;
  Future<void> addToCollection() async {
    if (user != null) {
      DatabaseReference filmRef = FirebaseDatabase.instance
          .ref()
          .child('films')
          .child(FirebaseAuth.instance.currentUser!.uid);
      String? filmId = filmRef.push().key.toString();
      await filmRef.child(filmId.toString()).set(
        {
          'filmName': GetIt.I.get<FilmNameSingleton>().filmName,
          'filmId': filmId,
          'kinopoiskId': GetIt.I.get<MovieIdSingleton>().kinopoiskId,
          'posterUrl': GetIt.I.get<PosterSingleton>().poster,
        },
      );
      GetIt.I.get<DbMovieId>().updateValue(filmId);
      GetIt.I.get<IsAddedSingleton>().updateValue(true);
    }
  }

  Future<void> removeFromCollection() async {
    if (user != null) {
      DatabaseReference filmRef = FirebaseDatabase.instance
          .ref()
          .child('films')
          .child(FirebaseAuth.instance.currentUser!.uid);
      await filmRef.child(GetIt.I.get<DbMovieId>().id.toString()).remove();
      GetIt.I.get<IsAddedSingleton>().updateValue(false);
    }
  }
}
