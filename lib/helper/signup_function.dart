 import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> createAccount({required String email,required String password}) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }