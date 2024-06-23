import 'package:films_app/repository/singletons/singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

class DatabaseRepository {
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
          'kinopoiskId': GetIt.I.get<MovieIdSingleton>().kinopoiskId
        },
      );
      print('film added');
      GetIt.I.get<DbMovieId>().updateValue(filmId);
      GetIt.I.get<IsAddedSingleton>().updateValue(true);
    }
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
              print('film is in collection');
            } else {
              GetIt.I.get<IsAddedSingleton>().updateValue(false);
              print('film is not in collection');
            }
          }
        }
      });
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
