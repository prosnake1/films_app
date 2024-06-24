import 'package:films_app/i18n/strings.g.dart';
import 'package:films_app/pages/login/widgets/log_in_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var e = t.login;
    var a = t.log_in_alerts;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(e.log_in),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: emailController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: e.email,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: e.password,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
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
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: 180,
              height: 70,
              child: LogInButton(
                  emailController: emailController,
                  passwordController: passwordController,
                  a: a,
                  e: e),
            ),
          ],
        ),
      ),
    );
  }
}
