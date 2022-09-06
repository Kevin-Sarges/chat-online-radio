import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthFirebase {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<bool> isLoggerIn() async {
    bool isLoggerIn = await googleSignIn.isSignedIn();

    if (isLoggerIn) {
      return true;
    } else {
      return false;
    }
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
