import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  final createPasswordcontroller = TextEditingController();
  final confirmPasswordcontroller = TextEditingController();

  var createPasswordText = ''.obs;
  var confirmPasswordText = ''.obs;

  var isPasswordValidObs =
      false.obs; // Validity of password (uppercase + length)
  var isPasswordMismatch = false.obs; // Checks if passwords match
  RxBool allFieldsFilled =
      false.obs; // Enables button if all conditions are met

  var isCreatePasswordNotEmpty = false.obs; // To track prefix icon color
  var isConfirmPasswordNotEmpty = false.obs; // To track prefix icon color

  @override
  void onInit() {
    super.onInit();

    createPasswordcontroller.addListener(() {
      createPasswordText.value = createPasswordcontroller.text;
      isPasswordValidObs.value = isPasswordValid(createPasswordText.value);
      isCreatePasswordNotEmpty.value = createPasswordText.value.isNotEmpty;
      _updateFieldsStatus();
    });

    confirmPasswordcontroller.addListener(() {
      confirmPasswordText.value = confirmPasswordcontroller.text;
      isConfirmPasswordNotEmpty.value = confirmPasswordText.value.isNotEmpty;
      _updateFieldsStatus();
    });
  }

  bool isPasswordValid(String password) {
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasMinLength = password.length >= 8;
    return hasUppercase && hasMinLength;
  }

  bool doPasswordsMatch() {
    return createPasswordText.value == confirmPasswordText.value;
  }

  void _updateFieldsStatus() {
    bool isCreatePasswordFilled = createPasswordText.value.isNotEmpty;
    bool isConfirmPasswordFilled = confirmPasswordText.value.isNotEmpty;

    allFieldsFilled.value = isCreatePasswordFilled && isConfirmPasswordFilled;
  }

  @override
  void dispose() {
    createPasswordcontroller.dispose();
    confirmPasswordcontroller.dispose();
    super.dispose();
  }
}
