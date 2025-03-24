import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  var isFormFilled = false.obs;
  var isUsernameFilled = false.obs;
  var isEmailFilled = false.obs;

  void checkFormFilled() {
    isUsernameFilled.value = usernameController.text.trim().isNotEmpty;
    isEmailFilled.value = emailController.text.trim().isNotEmpty;

    isFormFilled.value = isUsernameFilled.value && isEmailFilled.value;
  }

  @override
  void onInit() {
    super.onInit();

    usernameController.addListener(checkFormFilled);
    emailController.addListener(checkFormFilled);
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
