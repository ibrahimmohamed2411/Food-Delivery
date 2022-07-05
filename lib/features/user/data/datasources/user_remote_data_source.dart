import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class UserRemoteDataSource {
  Future<Unit> logIn({required String email, required String password});
  Future<String> resetPassword({required String email});
  Future<Unit> signInWithGoogle();
  Future<String> signUp({
    required String email,
    required String password,
    required String lastName,
    required String firstName,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firestore;
  UserRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.firestore,
  });

  @override
  Future<Unit> logIn({required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return Future.value(unit);
  }

  @override
  Future<String> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return Future.value('Check your email for a link to reset your password.');
  }

  @override
  Future<Unit> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        // return userCredential.user;
      } else {
        throw FirebaseAuthException(
            code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
            message: 'Missing Google Id Token');
      }
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
    return Future.value(unit);
  }

  @override
  Future<String> signUp({
    required String email,
    required String password,
    required String lastName,
    required String firstName,
  }) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await firestore.collection('users').doc(firebaseAuth.currentUser!.uid).set({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
    });
    return 'Sign Up Successful';
  }
}
