import 'package:films_app/i18n/strings.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var s = t.sign_up;
    var a = t.sign_up_alert;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmController = TextEditingController();
    var fullNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(s.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                hintText: s.name,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: s.email,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: s.password,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: s.confirm_pass,
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
                  Fluttertoast.showToast(msg: a.fill_fields);
                  return;
                }

                if (password.length < 6) {
                  Fluttertoast.showToast(msg: a.weak_pass);

                  return;
                }

                if (password != confirmPass) {
                  // show error toast
                  Fluttertoast.showToast(msg: a.pass_not_match);

                  return;
                }

                ProgressDialog progressDialog = ProgressDialog(
                  context,
                  title: Text(a.signing_in),
                  message: Text(a.please_wait),
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

                    Fluttertoast.showToast(msg: a.success);

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  } else {
                    Fluttertoast.showToast(msg: a.failed_err);
                  }

                  progressDialog.dismiss();
                } on FirebaseAuthException catch (e) {
                  progressDialog.dismiss();
                  if (e.code == 'auth/email-already-exists') {
                    Fluttertoast.showToast(msg: a.email_already_in_use_err);
                  } else if (e.code == 'weak-password') {
                    Fluttertoast.showToast(msg: a.weak_pass_err);
                  }
                } catch (e) {
                  progressDialog.dismiss();
                  Fluttertoast.showToast(msg: a.went_wrong_err);
                }
              },
              child: Text(s.sign_up),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
