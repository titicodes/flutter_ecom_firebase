import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_firebase/apis/model/user_model.dart';
import 'package:flutter_ecom_firebase/constants/strings.dart';
import 'package:flutter_ecom_firebase/routes/route_management.dart';
import 'package:flutter_ecom_firebase/utils/app_utility.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart' as db;
import '../../../enum/enum.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart' as path;

class RegisterController extends GetxController {
  static RegisterController get find => Get.find();

  AuthStatus authStatus = AuthStatus.notDetermined;
  bool isSignInWithGoogle = false;
  User? user;
  late String userId;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  db.Query? _profileQuery;
  // List<UserModel> _profileUserModelList;
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  UserModel? get profileUserModel => _userModel;

  final fNameTextController = TextEditingController();
  final lNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final unameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  final FocusScopeNode focusNode = FocusScopeNode();
  final _isLoading = false.obs;
  final _showPassword = true.obs;
  final _showConfirmPassword = true.obs;
  final _isOtpSent = false.obs;
  final _isEmailVerified = false.obs;

  bool get isLoading => _isLoading.value;
  bool get showPassword => _showPassword.value;
  bool get showConfirmPassword => _showConfirmPassword.value;
  bool get isOtpSent => _isOtpSent.value;
  bool get isEmailVerified => _isEmailVerified.value;

  void toggleViewPassword() {
    _showPassword(!_showPassword.value);
    update();
  }

  void toggleViewConfirmPassword() {
    _showConfirmPassword(!_showConfirmPassword.value);
    update();
  }

  void _clearRegisterTextControllers() {
    fNameTextController.clear();
    lNameTextController.clear();
    unameTextController.clear();
    passwordTextController.clear();
    confirmPasswordTextController.clear();
    emailTextController.clear();
  }

  /// Alter select auth method, login and sign up page
  void openSignUpPage() {
    authStatus = AuthStatus.notLoggedIn;
    userId = '';
    update();
  }

  Future<User?> handleGoogleSignIn() async {
    AppUtility.showLoadingDialog();
    _isLoading.value = true;
    update();
    try {
      /// Record log in firebase kAnalytics about Google login
      kAnalytics.logLogin(loginMethod: 'google_login');
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google login cancelled by user');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      user = (await _firebaseAuth.signInWithCredential(credential)).user;
      authStatus = AuthStatus.logggedIn;
      userId = user!.uid;
      isSignInWithGoogle = true;
      createUserFromGoogleSignIn(user!);
      update();
      return user;
    } catch (error) {
      user = null;
      authStatus = AuthStatus.notLoggedIn;
      AppUtility.closeDialog();
      _isLoading.value = false;
      update();
      AppUtility.showSnackBar('Error: ${error.toString()}', StringValues.error);

      return null;
    }
  }

  // Future<void> handleGoogleSignIn() async{
  //    AppUtility.closeFocus();
  //   await _handleGoogleSignIn().then((value) {
  //     if(user == null){

  //     }
  //   });
  // }

  /// Create user profile from google login
  void createUserFromGoogleSignIn(User user) {
    var diff = DateTime.now().difference(user.metadata.creationTime!);
    // Check if user is new or old
    // If user is new then add new user to firebase realtime kDatabase
    if (diff < const Duration(seconds: 15)) {
      UserModel model = UserModel(
        profilePic: user.photoURL!,
        displayName: user.displayName!,
        firstName: user.displayName!.split(' ')[0],
        lastName: user.displayName!.split(' ').last,
        email: userModel!.email,
        key: user.uid,
        userId: user.uid,
        contact: user.phoneNumber!,
        isVerified: user.emailVerified,
      );
      createUser(model, newUser: true);
    } else {
      AppUtility.log('Last login at: ${user.metadata.lastSignInTime}');
    }
  }

  /// `Create` and `Update` user
  /// IF `newUser` is true new user is created
  /// Else existing user will update with new values
  void createUser(UserModel user, {bool newUser = false}) {
    if (newUser) {
      // Create username by the combination of name and id
      user.displayName =
          AppUtility.getUserName(id: user.userId!, name: user.displayName!);
      kAnalytics.logEvent(name: 'create_newUser');

      // Time at which user is created
      user.createdAt = DateTime.now().toUtc().toString();
    }

    kDatabase.child('profile').child(user.userId!).set(user.toJson());
    _userModel = user;
  }

  Future<String?> register(UserModel model, {required String password}) async {
    if (fNameTextController.text.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterFirstName,
        StringValues.warning,
      );
      return null;
    }
    if (lNameTextController.text.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterLastName,
        StringValues.warning,
      );
      return null;
    }
    if (emailTextController.text.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterEmail,
        StringValues.warning,
      );
      return null;
    }
    if (unameTextController.text.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterUsername,
        StringValues.warning,
      );
      return null;
    }
    if (passwordTextController.text.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterPassword,
        StringValues.warning,
      );
      return null;
    }
    if (confirmPasswordTextController.text.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterConfirmPassword,
        StringValues.warning,
      );
      return null;
    }

    AppUtility.showLoadingDialog();
    _isLoading.value = true;
    update();

    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );

      user = result.user;
      authStatus = AuthStatus.logggedIn;
      kAnalytics.logSignUp(signUpMethod: 'register');
      result.user!.updateDisplayName(
        userModel!.displayName,
      );
      result.user!.updatePhotoURL(userModel?.profilePic);

      _userModel = userModel;
      _userModel!.key = user!.uid;
      _userModel!.userId = user!.uid;
      createUser(_userModel!, newUser: true);
      _clearRegisterTextControllers();
      AppUtility.closeDialog();
      _isLoading.value = false;
      update();
      RouteManagement.goToBack();
         RouteManagement.goToLoginView();
      AppUtility.showSnackBar(
        StringValues.registrationSuccessful,
        StringValues.success,
      );
      return user!.uid;
    } catch (error) {
      return null;
    }
  }
}
