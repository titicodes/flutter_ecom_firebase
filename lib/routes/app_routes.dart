part of 'app_pages.dart';

abstract class AppRoutes {
  static const loginSignUpPage = _Routes.loginSignUpPage;
  static const signupPage = _Routes.signupPage;
}

abstract class _Routes {
  static const loginSignUpPage = "/login-signup";
  static const signupPage = "/signup";
}
