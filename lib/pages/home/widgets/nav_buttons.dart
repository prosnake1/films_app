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
      height: 200,
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
          const SizedBox(
            height: 50,
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
