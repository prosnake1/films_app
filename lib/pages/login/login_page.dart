import 'package:films_app/i18n/strings.g.dart';
import 'package:films_app/pages/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
