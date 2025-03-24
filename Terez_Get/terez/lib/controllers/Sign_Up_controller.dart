import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final createPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var emailText = ''.obs;
  var usernameText = ''.obs;
  var passwordText = ''.obs;
  var confirmPasswordText = ''.obs;
  var isPasswordValidObs = false.obs;
  var isPasswordMismatch = false.obs;
  var isLogin = false.obs;

  RxBool allFieldsFilled = false.obs;

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(() {
      emailText.value = emailController.text;
      _updateFieldsStatus();
    });

    usernameController.addListener(() {
      usernameText.value = usernameController.text;
      _updateFieldsStatus();
    });

    createPasswordController.addListener(() {
      passwordText.value = createPasswordController.text;
      isPasswordValidObs.value = isPasswordValid(createPasswordController.text);
      _updateFieldsStatus();
    });

    confirmPasswordController.addListener(() {
      confirmPasswordText.value = confirmPasswordController.text;
      _updateFieldsStatus();
    });
  }

  bool isPasswordValid(String password) {
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasMinLength = password.length >= 8;
    return hasUppercase && hasMinLength;
  }

  bool doPasswordsMatch() {
    return createPasswordController.text == confirmPasswordController.text;
  }

  void _updateFieldsStatus() {
    emailText.value = emailController.text.trim();
    usernameText.value = usernameController.text.trim();
    passwordText.value = createPasswordController.text;
    confirmPasswordText.value = confirmPasswordController.text;

    bool isEmailFilled = emailText.value.isNotEmpty;
    bool isUsernameFilled = usernameText.value.isNotEmpty;
    bool isPasswordFilled = passwordText.value.isNotEmpty;
    bool isConfirmFilled = confirmPasswordText.value.isNotEmpty;
    // bool passwordsMatch = doPasswordsMatch();

    if (isLogin.value) {
      allFieldsFilled.value = isEmailFilled && isPasswordFilled;
    } else {
      allFieldsFilled.value = isEmailFilled &&
          isUsernameFilled &&
          isPasswordFilled &&
          isConfirmFilled;
    }
  }

  void clearFields() {
    emailController.clear();
    usernameController.clear();
    createPasswordController.clear();
    confirmPasswordController.clear();

    emailText.value = '';
    usernameText.value = '';
    passwordText.value = '';
    confirmPasswordText.value = '';

    isPasswordMismatch.value = false;
    isPasswordValidObs.value = false;
    allFieldsFilled.value = false;
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    createPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
