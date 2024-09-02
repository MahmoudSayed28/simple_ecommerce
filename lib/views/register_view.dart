// ignore_for_file: use_build_context_synchronously


import 'package:e_commerce/helper/show_snacbar.dart';
import 'package:e_commerce/helper/signup_function.dart';
import 'package:e_commerce/views/home_view.dart';
import 'package:e_commerce/views/login_view.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_row.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const String id = 'register view';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    late String email;
    late String password;
    bool isloading =false;
    GlobalKey<FormState> formKey = GlobalKey();
    return Form(
      key: formKey,
      child: ModalProgressHUD(
        inAsyncCall:isloading ,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Register',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 70,
                    child: Icon(Icons.person, size: 60),
                  ),
                ),
                 CustomTextField(
                  ispassword: false,
                  hintText: 'Enter Your username',
                  icon: Icons.person,
                   onChanged: (value) {
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  ispassword: false,
                  hintText: 'Email',
                  icon: Icons.email,
                  onChanged: (value) {
                    email=value;
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
                const SizedBox(height: 150),
                CustomButton(
                  text: 'Register',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                        isloading = true;
                    setState(() {});

                      try {
                        await createAccount(email: email, password: password);
                         isloading = false;
                      setState(() {});
                        Navigator.pushReplacementNamed(context, HomeView.id,);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        showSnackBar(context, e.toString());
                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomRow(
                  text: ' have an account? ',
                  option: ' sign in ',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginView.id);
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
