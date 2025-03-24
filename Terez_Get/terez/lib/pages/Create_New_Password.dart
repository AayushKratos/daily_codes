import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/colors/App_colors.dart';
import 'package:terez/controllers/Create_New_Password_controller.dart';
import 'package:terez/pages/Home_screen.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final CreateNewPasswordController controller =
      Get.put(CreateNewPasswordController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(color: AppColors.DarkGreen),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  Text('Don’t Worry, Let’s Create Your New Password'),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.center,
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
                        child: Container(
                          height: 110,
                          width: 314,
                          decoration: BoxDecoration(
                              color: AppColors.LightGreen3,
                              borderRadius: BorderRadius.circular(30)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 58,
                                width: 274,
                                decoration: BoxDecoration(
                                    color: AppColors.LightGreen2,
                                    borderRadius: BorderRadius.circular(30)),
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
                                      width: 10,
                                    ),
                                    Text(
                                      '● ● ● ● ● ● ● ● ● ● ● ●',
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: screenHeight * 0.45,
                width: screenWidth,
                decoration: BoxDecoration(
                    color: AppColors.LightGreen,
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.075),
                        Obx(() => TextFormField(
                              controller: controller.createPasswordcontroller,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: controller.isPasswordMismatch.value
                                      ? Colors.red
                                      : controller
                                              .isCreatePasswordNotEmpty.value
                                          ? AppColors.DarkGreen
                                          : Colors.grey,
                                ),
                                hintText: 'Create new password',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            )),
                        SizedBox(height: 30),
                        Obx(() => Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: controller.isPasswordValidObs.value
                                      ? Colors.green
                                      : Colors.amber,
                                  size: 10,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  controller.isPasswordValidObs.value
                                      ? 'Password is safe'
                                      : 'Must at least 8 characters, and 1 uppercase',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 30),
                        Obx(() => TextFormField(
                              controller: controller.confirmPasswordcontroller,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: controller.isPasswordMismatch.value
                                      ? Colors.red
                                      : controller
                                              .isConfirmPasswordNotEmpty.value
                                          ? AppColors.DarkGreen
                                          : Colors.grey,
                                ),
                                hintText: 'Confirm new password',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            )),
                        SizedBox(height: 30),
                        Obx(() => Container(
                              height: 50,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                color: controller.allFieldsFilled.value
                                    ? AppColors.DarkGreen
                                    : AppColors.LightGreen2,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  bool isValid =
                                      _formKey.currentState!.validate();
                                  bool passwordsMatch =
                                      controller.doPasswordsMatch();

                                  controller.isPasswordMismatch.value =
                                      !passwordsMatch;

                                  if (isValid && passwordsMatch) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  }
                                },
                                child: Text(
                                  'Create Password',
                                  style: TextStyle(
                                    color: controller.allFieldsFilled.value
                                        ? Colors.white
                                        : AppColors.DarkGreen,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
