import 'package:get/get.dart';

import '../modules/auth/views/login_register.dart';

part 'app_routes.dart';

abstract class AppPages {
  static var defaultTransition = Transition.circularReveal;
  static final pages = [
    GetPage(
      name: _Routes.loginSignUpPage,
      page: LoginRegister.new,
      transitionDuration: transitionDuration,
      transition: defaultTransition,
    ),
  ];
  
  static var transitionDuration = const Duration(milliseconds: 500);
}

