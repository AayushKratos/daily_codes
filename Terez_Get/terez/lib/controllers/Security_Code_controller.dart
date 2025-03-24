import 'package:get/get.dart';

class SecurityCodeController extends GetxController {
  RxString pinCode = ''.obs;

  bool get isPinComplete => pinCode.value.length == 6;

  void onPinCompleted(String pin) {
    pinCode.value = pin;
  }
}
