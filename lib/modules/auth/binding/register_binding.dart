import 'package:flutter_ecom_firebase/modules/auth/controllers/register_controller.dart';
import 'package:get/get.dart';


class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(RegisterController.new);
  }
}
