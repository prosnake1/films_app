import 'package:films_app/i18n/strings.g.dart';
import 'package:films_app/theme/theme.dart';
import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.5,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home/search');
            },
            style: lightTheme.elevatedButtonTheme.style,
            child: Text(t.open_search),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home/collection');
            },
            style: lightTheme.elevatedButtonTheme.style,
            child: Text(t.open_collection),
          ),
        ],
      ),
    );
  }
}
