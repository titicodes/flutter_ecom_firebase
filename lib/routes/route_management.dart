import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  /// Welcome ------------------------------------------------------------------
  static void gotoLoginRegisterView() {
    Get.toNamed(AppRoutes.loginRegister);
  }

  /// Auth ---------------------------------------------------------------------
  static void goToLoginView() {
    Get.toNamed(AppRoutes.loginSignUpPage);
  }

  static void goToRegisterView() {
    Get.toNamed(AppRoutes.signupPage);
  }

  static void gotoForgetPasswordView() {
    Get.toNamed(AppRoutes.forgetPasswordPage);
  }

  static void gotoResetPasswordPage() {
    Get.toNamed(AppRoutes.resetPasswordPage);
  }

  static void goToBack() {
    Get.toNamed(AppRoutes.loginRegister);
  }
}
