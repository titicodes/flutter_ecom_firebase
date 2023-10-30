import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecom_firebase/apis/model/user_model.dart';

class LoginController extends GetxController {
  static LoginController get find => Get.find();
  User? user;
  UserModel? userModel;

  final emailUnameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final FocusScopeNode focusNode = FocusScopeNode();
  final _isLoading = false.obs;
  final _showPassword = true.obs;

   bool get isLoading => _isLoading.value;
  bool get showPassword => _showPassword.value;

  Future<User?> signUp() async {}
}
