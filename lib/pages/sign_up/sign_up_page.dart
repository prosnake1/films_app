import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmController = TextEditingController();
    var fullNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                hintText: 'Имя',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Почта',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Пароль',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Подтвердить пароль',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  var fullName = fullNameController.text.trim();
                  var email = emailController.text.trim();
                  var password = passwordController.text.trim();
                  var confirmPass = confirmController.text.trim();

                  if (fullName.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty ||
                      confirmPass.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Пожалуйста, заполните все поля');
                    return;
                  }

                  if (password.length < 6) {
                    Fluttertoast.showToast(
                        msg: 'Слабый пароль, 6 символов минимум');

                    return;
                  }

                  if (password != confirmPass) {
                    // show error toast
                    Fluttertoast.showToast(msg: 'Пароли не совпадают');

                    return;
                  }

                  ProgressDialog progressDialog = ProgressDialog(
                    context,
                    title: const Text('Идет регистрация'),
                    message: const Text('Пожалуйста подождите'),
                  );

                  progressDialog.show();
                  try {
                    FirebaseAuth auth = FirebaseAuth.instance;

                    UserCredential userCredential =
                        await auth.createUserWithEmailAndPassword(
                            email: email, password: password);

                    if (userCredential.user != null) {
                      DatabaseReference userRef =
                          FirebaseDatabase.instance.ref().child('users');

                      String uid = userCredential.user!.uid;
                      int dt = DateTime.now().millisecondsSinceEpoch;

                      await userRef.child(uid).set({
                        'fullName': fullName,
                        'email': email,
                        'uid': uid,
                        'dt': dt,
                        'profileImage': ''
                      });

                      Fluttertoast.showToast(msg: 'Success');

                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    } else {
                      Fluttertoast.showToast(msg: 'Failed');
                    }

                    progressDialog.dismiss();
                  } on FirebaseAuthException catch (e) {
                    progressDialog.dismiss();
                    if (e.code == 'email-already-in-use') {
                      Fluttertoast.showToast(msg: 'Почта уже используется');
                    } else if (e.code == 'weak-password') {
                      Fluttertoast.showToast(msg: 'Пароль слишком слабый');
                    }
                  } catch (e) {
                    progressDialog.dismiss();
                    Fluttertoast.showToast(msg: 'Что-то пошло не так');
                  }
                },
                child: const Text('Зарегистрироваться')),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
