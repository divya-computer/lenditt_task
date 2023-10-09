import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  var isLogged = false.obs;
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    final email = emailController.text;
    final password = passwordController.text;

    // Perform validation.
    if (email.isEmpty || !email.contains('@')) {
      emailError.value = 'Invalid email';
      return;
    } else if (password.isEmpty || password.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      return;
    } else {
      emailError.value = '';
      passwordError.value = '';
    }
    Get.offAllNamed('/home');
    isLogged.value = true;

    // if (password.isEmpty || password.length < 6) {
    //   passwordError.value = 'Password must be at least 6 characters';
    //   return;
    // } else {
    //   passwordError.value = '';
    // }

    // Get.offAllNamed('/home');
  }

  void logout() {
    isLogged.value = false;
  }
}
