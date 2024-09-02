// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/views/home_view.dart';
import 'package:e_commerce/views/register_view.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_row.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const id = 'login view';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    late String email;
    late String password;
    bool isloading = false;
    GlobalKey<FormState> formkay = GlobalKey();
    return Form(
      key: formkay,
      child: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'LogIn',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 180),
                CustomTextField(
                  ispassword: false,
                  hintText: 'Email',
                  icon: Icons.email,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  ispassword: true,
                  hintText: 'Password',
                  icon: Icons.visibility,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'LogIn',
                  onPressed: () async {
                    if (formkay.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email, password: password);
                        isloading = false;
                        setState(() {});
                        Navigator.pushReplacementNamed(context, HomeView.id);
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('error'),
                                content: Text('Wrong email or password'),
                              );
                            });
                      }
                    }
                  },
                ),
                const SizedBox(height: 30),
                CustomRow(
                  text: 'Don\'t  have an account? ',
                  option: ' SignUp ',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RegisterView.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
