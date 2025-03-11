import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isSignIn = false;
  bool showPasswordError = false;
  bool isPasswordSafe = false;
  bool showEmailError = false;
  bool showUsernameError = false;
  bool showConfirmPasswordError = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> isFormFilledNotifier = ValueNotifier(false);
  final ValueNotifier<bool> isPasswordSafeNotifier = ValueNotifier(false);

  SignUpProvider() {
    emailController.addListener(() {
      _updateFormState();
      notifyListeners();
    });

    usernameController.addListener(() {
      _updateFormState();
      notifyListeners();
    });

    passwordController.addListener(() {
      validatePassword();
      _updateFormState();
      notifyListeners();
    });

    confirmPasswordController.addListener(() {
      validateConfirmPassword();
      _updateFormState();
      notifyListeners();
    });
  }

  void toggleSignIn(bool value) {
    isSignIn = value;
    notifyListeners();
  }

  void refreshForm() {
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isPasswordSafeNotifier.value = false;
    isFormFilledNotifier.value = false;
    notifyListeners();
  }

  void _updateFormState() {
    bool isFormFilled = isSignIn
        ? emailController.text.isNotEmpty && passwordController.text.isNotEmpty
        : emailController.text.isNotEmpty &&
            usernameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            confirmPasswordController.text.isNotEmpty;

    if (isFormFilledNotifier.value != isFormFilled) {
      isFormFilledNotifier.value = isFormFilled;
    }
  }

  final ValueNotifier<bool> showConfirmPasswordErrorNotifier =
      ValueNotifier(false);

  void validateConfirmPassword() {
    bool newShowConfirmPasswordError =
        confirmPasswordController.text.isNotEmpty &&
            confirmPasswordController.text != passwordController.text;

    if (showConfirmPasswordErrorNotifier.value != newShowConfirmPasswordError) {
      showConfirmPasswordErrorNotifier.value = newShowConfirmPasswordError;
    }
  }

  void validatePassword() {
    String password = passwordController.text;
    bool isValid = password.length >= 8 && password.contains(RegExp(r'[A-Z]'));

    if (isPasswordSafeNotifier.value != isValid) {
      isPasswordSafeNotifier.value = isValid;
      showPasswordError = !isValid;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
