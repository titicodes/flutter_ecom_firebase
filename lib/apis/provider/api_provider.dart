import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom_firebase/constants/enums.dart';
import 'package:flutter_ecom_firebase/constants/strings.dart';
import 'package:flutter_ecom_firebase/utils/app_utility.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ApiProvider {
  bool isSignInWithGoogle = false;
  User? user;
  late String userId;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthStatus authStatus = AuthStatus.notDetermined;

  Future<User?> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception(StringValues.cancelGoogleSignIn);
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      user = (await _firebaseAuth.signInWithCredential(credential)).user;
      authStatus = AuthStatus.loggedIn;
      userId = user!.uid;
      isSignInWithGoogle = true;
      createUserFromGoogleSignIn(user!);
      return user;
    } catch (e) {
      user = null;
      authStatus = AuthStatus.notLoggedIn;
      AppUtility.log('');
      return null;
    }
  }
}

void createUserFromGoogleSignIn(User user) {}
