import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/colors/App_colors.dart';
import 'package:terez/controllers/Forgot_Password.dart';
import 'package:terez/pages/Security_Code.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

  final _formKey = GlobalKey<FormState>();

  String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                height: screenHeight,
                width: screenWidth,
                decoration: BoxDecoration(color: AppColors.DarkGreen),
                child: Stack(
                  children: [
                    Positioned(
                      top: 150,
                      left: 45,
                      child: Stack(
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
                            left: 5,
                            child: Container(
                              height: 110,
                              width: 315,
                              decoration: BoxDecoration(
                                  color: AppColors.LightGreen3,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    height: 58,
                                    width: 274,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.lock_outline,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          '● ● ● ● ● ● ● ● ● ● ● ●',
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: screenHeight * 0.5,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: AppColors.LightGreen,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.075),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(() => TextFormField(
                              controller: controller.usernameController,
                              validator: validateUsername,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: controller.isUsernameFilled.value
                                      ? AppColors.DarkGreen
                                      : Colors.grey,
                                ),
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.grey),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            )),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(() => TextFormField(
                              controller: controller.emailController,
                              validator: validateEmail,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: controller.isEmailFilled.value
                                      ? AppColors.DarkGreen
                                      : Colors.grey,
                                ),
                                hintText: 'Email Address',
                                hintStyle: TextStyle(color: Colors.grey),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            )),
                      ),
                      SizedBox(height: 30),
                      Obx(() => Container(
                            height: 50,
                            width: screenWidth * 0.85,
                            decoration: BoxDecoration(
                              color: controller.isFormFilled.value
                                  ? AppColors.DarkGreen
                                  : AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    controller.isFormFilled.value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SecurityCode()));
                                }
                              },
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    color: controller.isFormFilled.value
                                        ? Colors.white
                                        : AppColors.DarkGreen),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
