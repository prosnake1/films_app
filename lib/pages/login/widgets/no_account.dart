import 'package:flutter/material.dart';

class NoAccountWidget extends StatelessWidget {
  const NoAccountWidget({
    super.key,
    required this.e,
  });

  final e;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(e.no_account),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/login/sign-up');
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(1),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            e.sign_up,
          ),
        ),
      ],
    );
  }
}
