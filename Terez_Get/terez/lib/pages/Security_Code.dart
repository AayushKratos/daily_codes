import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:terez/colors/App_colors.dart';
import 'package:terez/controllers/Security_Code_controller.dart';
import 'package:terez/pages/Create_New_Password.dart';

class SecurityCode extends StatefulWidget {
  const SecurityCode({super.key});

  @override
  State<SecurityCode> createState() => _SecurityCodeState();
}

class _SecurityCodeState extends State<SecurityCode> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final SecurityCodeController controller = Get.put(SecurityCodeController());

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      textStyle: TextStyle(fontSize: 20, color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.DarkGreen),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(color: AppColors.DarkGreen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.25,
                  ),
                  Text('Verify Security Code'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'We have sent you 6 digits verification code to reset your password, please check your spam folder too.'),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        width: 326,
                        decoration: BoxDecoration(
                            color: AppColors.DarkGreen2,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 7.5,
                        child: Container(
                          height: 110,
                          width: 314,
                          decoration: BoxDecoration(
                              color: AppColors.LightGreen3,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Pinput(
                              length: 6,
                              enabled: false,
                              controller: TextEditingController(text: '●●●●●●'),
                              defaultPinTheme: PinTheme(
                                width: 40,
                                height: 40,
                                textStyle: TextStyle(
                                    fontSize: 20, color: AppColors.DarkGreen),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(color: AppColors.DarkGreen),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: screenHeight * 0.3,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: AppColors.LightGreen,
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text('Create 6 Digit PIN'),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Pinput(
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            onCompleted: controller.onPinCompleted,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Obx(() => Container(
                              width: screenWidth,
                              height: 50,
                              decoration: BoxDecoration(
                                color: controller.isPinComplete
                                    ? AppColors.DarkGreen
                                    : AppColors.LightGreen2,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextButton(
                                onPressed: controller.isPinComplete
                                    ? () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateNewPassword()));
                                      }
                                    : null,
                                child: Text(
                                  'Verify and Continue',
                                  style: TextStyle(
                                    color: controller.isPinComplete
                                        ? Colors.white
                                        : AppColors.DarkGreen,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
