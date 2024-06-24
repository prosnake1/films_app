import 'package:films_app/i18n/strings.g.dart';
import 'package:films_app/pages/login/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var e = t.login;
  var a = t.log_in_alerts;
  late final emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(e.log_in),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: e.password,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            NoAccountWidget(e: e),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 13,
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
