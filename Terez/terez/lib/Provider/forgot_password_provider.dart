import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  bool isUsernameError = false;
  bool isEmailError = false;
  bool isPasswordError = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> isFormFilledNotifier = ValueNotifier(false);

  ForgotPasswordProvider() {
    usernameController.addListener(() {
      _updateFormState();
      notifyListeners();
    });

    emailController.addListener(() {
      _updateFormState();
      notifyListeners();
    });

    passwordController.addListener(() {
      _updateFormState();
      notifyListeners();
    });
  }

  void refreshForm() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    isFormFilledNotifier.value = false;
    notifyListeners();
  }

  void _updateFormState() {
    bool isFormFilled = usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
    if (isFormFilledNotifier.value != isFormFilled) {
      isFormFilledNotifier.value = isFormFilled;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
