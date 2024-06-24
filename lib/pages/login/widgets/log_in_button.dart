import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.a,
    required this.e,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final a;
  final e;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var email = emailController.text.trim();
        var password = passwordController.text.trim();
        if (email.isEmpty || password.isEmpty) {
          Fluttertoast.showToast(msg: a.fill_fields);
          return;
        }
        ProgressDialog progressDialog = ProgressDialog(context,
            title: Text(a.loggin_in), message: Text(a.please_wait), blur: 80);
        progressDialog.show();

        try {
          FirebaseAuth auth = FirebaseAuth.instance;

          UserCredential userCredential = await auth.signInWithEmailAndPassword(
              email: email, password: password);
          if (userCredential.user != null) {
            progressDialog.dismiss();
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamed('/home');
          }
        } on FirebaseAuthException catch (e) {
          progressDialog.dismiss();
          if (e.code == 'user-not-found') {
            Fluttertoast.showToast(msg: a.user_not_found);
          } else if (e.code == 'wrong-password') {
            Fluttertoast.showToast(msg: a.wrong_pass);
          } else {
            Fluttertoast.showToast(msg: a.went_wrong);
          }
        } catch (e) {
          Fluttertoast.showToast(msg: a.went_wrong);
          progressDialog.dismiss();
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        e.log_in,
      ),
    );
  }
}
