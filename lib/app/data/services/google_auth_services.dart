import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_radio/app/data/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuthFirebase {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late SharedPreferences preferences;

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

      User? firebaseUser =
          (await firebaseAuth.signInWithCredential(credential)).user;

      final QuerySnapshot result = await db
          .collection('users')
          .where('id', isEqualTo: firebaseUser!.uid)
          .get();

      final List<DocumentSnapshot> document = result.docs;

      if (document.isEmpty) {
        db.collection('users').doc(firebaseUser.uid).set(
          {
            'id': firebaseUser.uid,
            'name': firebaseUser.displayName,
            'emial': firebaseUser.email,
            'photoUrl': firebaseUser.photoURL,
          },
        );

        User? currentUser = firebaseUser;

        await preferences.setString('id', currentUser.uid);
        await preferences.setString('name', currentUser.displayName ?? '');
        await preferences.setString('email', currentUser.email ?? '');
        await preferences.setString('photoUrl', currentUser.photoURL ?? '');
      } else {
        DocumentSnapshot documentSnapshot = document[0];

        UserModel userChat = UserModel.fromJson(documentSnapshot);

        await preferences.setString('id', userChat.id);
        await preferences.setString('name', userChat.name);
        await preferences.setString('email', userChat.email);
        await preferences.setString('photoUrl', userChat.photoUrl);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
