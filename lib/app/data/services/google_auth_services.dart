import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthFirebase {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> isLoggerIn() async {
    User? userIsLoggerIn;

    firebaseAuth.authStateChanges().listen((user) {
      userIsLoggerIn = user;
    });

    return userIsLoggerIn;
  }

  Future<bool> signIn() async {
    try {
      final GoogleSignInAccount? _googleSignUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? _googleAuth =
          await _googleSignUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth?.accessToken,
        idToken: _googleAuth?.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);

      return true;
    } catch (e) {
      return false;
    }
  }
}
