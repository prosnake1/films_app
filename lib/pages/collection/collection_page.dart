import 'package:films_app/pages/collection/add_elements.dart';
import 'package:films_app/pages/collection/widgets/films_list.dart';
import 'package:films_app/repository/models/collection_film/collectionfilm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  User? user;
  DatabaseReference? filmRef;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      filmRef = FirebaseDatabase.instance.ref().child('films').child(user!.uid);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Коллекция'),
      ),
      body: StreamBuilder(
        stream: filmRef?.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            var event = snapshot.data as DatabaseEvent;
            var snapshot2 = event.snapshot.value;
            if (snapshot2 == null) {
              return const Center(
                child: Text('Нет добавленных фильмов'),
              );
            }
            var map =
                Map<String, dynamic>.from(snapshot2 as Map<dynamic, dynamic>);

            List<CollectionFilm> films = [];
            addElements(map, films);
            return FilmsList(films: films);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
