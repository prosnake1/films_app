import 'package:films_app/i18n/strings.g.dart';
import 'package:films_app/pages/home/bloc/top_films_bloc.dart';
import 'package:films_app/pages/home/widgets/widgets.dart';
import 'package:films_app/repository/abstracts/abstracts_repository.dart';
import 'package:films_app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _topFilmsBloc = TopFilmsBloc(GetIt.I<AbstractTopFilmsRep>());
  @override
  void initState() {
    _topFilmsBloc.add(LoadFilmsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(t.alert_title_logout.title),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(t.alert_title_logout.action_no)),
                      TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Text(t.alert_title_logout.action_yes))
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.logout_outlined)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TalkerScreen(
                    talker: GetIt.I<Talker>(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.document_scanner_outlined),
          )
        ],
        title: Text(
          t.home_title,
          style: lightTheme.textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          FilmsColumn(topFilmsBloc: _topFilmsBloc),
          const NavigationButtons()
        ],
      ),
    );
  }
}
