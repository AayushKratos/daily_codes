import 'package:flutter/material.dart';

class SetUpProvider extends ChangeNotifier {
  bool isFullNameError = false;
  bool isPhoneError = false;
  bool isEmailError = false;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController recoveryEmailController = TextEditingController();

  final ValueNotifier<bool> isFormFilledNotifier = ValueNotifier(false);

  SetUpProvider() {
    fullNameController.addListener(() {
      _updateFormState();
      notifyListeners();
    });

    phoneController.addListener(() {
      _updateFormState();
      notifyListeners();
    });

    recoveryEmailController.addListener(() {
      _updateFormState();
      notifyListeners();
    });
  }

  void refreshForm() {
    fullNameController.clear();
    phoneController.clear();
    recoveryEmailController.clear();
    isFormFilledNotifier.value = false;
    notifyListeners();
  }

  void _updateFormState() {
    bool isFormFilled = fullNameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        recoveryEmailController.text.isNotEmpty;
    if (isFormFilledNotifier.value != isFormFilled) {
      isFormFilledNotifier.value = isFormFilled;
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    recoveryEmailController.dispose();
    super.dispose();
  }
}
