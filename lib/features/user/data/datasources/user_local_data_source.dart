import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class UserLocalDataSource {
  Stream<User?> autoStateChanges();
  Future<void> signOut();
}

class UserLocalDataSourceImp implements UserLocalDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  UserLocalDataSourceImp({
    required this.firebaseAuth,
    required this.googleSignIn,
  });
  @override
  Stream<User?> autoStateChanges() {
    return firebaseAuth.authStateChanges();
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
