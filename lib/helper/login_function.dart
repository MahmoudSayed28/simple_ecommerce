import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signWithEmailPassword({required String email,required String passWord }) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: passWord,
    );
  }