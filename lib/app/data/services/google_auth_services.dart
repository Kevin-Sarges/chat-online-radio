import 'package:desafio_radio/app/data/datasoucer/user_auth_impl.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthFirebase implements UserAuthImpl {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<UserCredential> signIn(bool signIn) async {
    final GoogleSignInAccount? _googleSignUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? _googleAuth =
        await _googleSignUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: _googleAuth?.accessToken,
      idToken: _googleAuth?.idToken,
    );

    return await firebaseAuth.signInWithCredential(credential);
  }
}
