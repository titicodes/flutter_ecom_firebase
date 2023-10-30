part of 'app_pages.dart';

abstract class AppRoutes {
  static const loginSignUpPage = _Routes.loginSignUpPage;
  static const signupPage = _Routes.signupPage;
  static const loginRegister = _Routes.loginRegister;
  static const forgetPasswordPage = _Routes.forgetPasswordPage;
  static const resetPasswordPage = _Routes.resetPasswordPage;
}

abstract class _Routes {
  static const loginSignUpPage = "/login-signup";
  static const signupPage = "/signup";
  static const loginRegister = '/loginRegiser';
  static const forgetPasswordPage = "/forgetPasswordPage";
  static const resetPasswordPage = "/resetPasswordPage";
}
