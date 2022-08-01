import 'package:firebase_auth/firebase_auth.dart';

abstract class UserAuthImpl {
  Future<UserCredential> signIn(bool signIn);
}
