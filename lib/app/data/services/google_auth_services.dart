import 'package:desafio_radio/app/domain/error/erro.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class GoogleAuthFirebase {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<Either<Error, bool>> isLoggerIn() async {
    try {
      bool isLoggerIn = await googleSignIn.isSignedIn();

      if (isLoggerIn == true) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } on Error catch (e) {
      return Left(e);
    } on Exception {
      return Left(
        Error('Exception'),
      );
    }
  }

  Future<Either<Error, UserCredential>> signIn() async {
    try {
      final GoogleSignInAccount? _googleSignUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? _googleAuth =
          await _googleSignUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth?.accessToken,
        idToken: _googleAuth?.idToken,
      );

      final userSignIn = await firebaseAuth.signInWithCredential(credential);

      return Right(userSignIn);
    } on Error catch (e) {
      return Left(e);
    } on Exception {
      return Left(
        Error('Exception'),
      );
    }
  }
}
