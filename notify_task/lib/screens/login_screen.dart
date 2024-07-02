import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notify_task/helper/show_snack_bar.dart';
import 'package:notify_task/screens/task_screen.dart';
import 'package:notify_task/widgets/login_button.dart';
import 'package:notify_task/widgets/text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 101,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomFormTextField(
                        obscureText: true,
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password',
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButon(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            try {
                              await loginUser();
                              Navigator.pushNamed(context, Taskly.id,
                                  arguments: email);
                            } on FirebaseAuthException catch (ex) {
                              if (ex.code == 'user-not-found') {
                                showSnackBar(context, 'user not found');
                              } else if (ex.code == 'wrong-password') {
                                showSnackBar(context, 'wrong password');
                              }
                            } catch (ex) {
                              print(ex);
                              showSnackBar(context, 'there was an error');
                            }

                            isLoading = false;
                            setState(() {});
                          } else {}
                        },
                        text: 'LOGIN',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
    }
  }
}
