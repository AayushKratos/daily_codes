import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/colors/App_colors.dart';
import 'package:terez/controllers/Sign_Up_controller.dart';
import 'package:terez/pages/Forgot_Password.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpController controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
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
                      height: !controller.isLogin.value
                          ? screenHeight * 0.15
                          : screenHeight * 0.25,
                    ),
                    Text(!controller.isLogin.value
                        ? 'Hey, Welcome!'
                        : 'Welcome Back!'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(!controller.isLogin.value
                        ? 'Let’s create your new account!'
                        : 'Enter your email account details to continue enjoy our amazing features!'),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => Container(
                          height: 62,
                          width: 364,
                          decoration: BoxDecoration(
                              color: AppColors.DarkGreen2,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.isLogin.value = false;
                                  controller
                                      .clearFields(); // Clear values when switching to Sign Up
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: controller.isLogin.value
                                        ? Colors.transparent
                                        : AppColors.White,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: controller.isLogin.value
                                          ? AppColors.White
                                          : AppColors.DarkGreen,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  controller.isLogin.value = true;
                                  controller
                                      .clearFields(); // Clear values when switching to Login
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: controller.isLogin.value
                                        ? AppColors.White
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: controller.isLogin.value
                                          ? AppColors.DarkGreen
                                          : AppColors.White,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: !controller.isLogin.value
                      ? screenHeight * 0.6
                      : screenHeight * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.LightGreen,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                      key: _formKey,
                      child: Obx(
                        () => Column(
                          children: [
                            !controller.isLogin.value
                                ? SizedBox(height: 30)
                                : SizedBox(
                                    height: screenHeight * 0.075,
                                  ),

                            // Email Field
                            Obx(() => TextFormField(
                                  controller: controller.emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email is required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: AppColors.White,
                                    filled: true,
                                    hintText: 'Email Address',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    prefixIcon: Icon(
                                      Icons.mail_outline,
                                      color: controller.emailText.isNotEmpty
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                )),
                            SizedBox(height: 30),

                            // Username Field
                            if (!controller.isLogin.value) ...[
                              Obx(() => TextFormField(
                                    controller: controller.usernameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Username is required';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: AppColors.White,
                                      filled: true,
                                      hintText: 'Username',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        color:
                                            controller.usernameText.isNotEmpty
                                                ? Colors.green
                                                : Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  )),
                              SizedBox(height: 30),
                            ],

                            // Create Password Field + Validation
                            Obx(() => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller:
                                          controller.createPasswordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password is required';
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                        color:
                                            controller.isPasswordMismatch.value
                                                ? Colors.red
                                                : Colors.black,
                                      ),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        fillColor: AppColors.White,
                                        filled: true,
                                        hintText: !controller.isLogin.value
                                            ? 'Create Password'
                                            : 'Password',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: controller
                                                  .isPasswordMismatch.value
                                              ? Colors.red
                                              : (controller
                                                      .passwordText.isNotEmpty
                                                  ? Colors.green
                                                  : Colors.grey),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                    ),
                                  ],
                                )),
                            !controller.isLogin.value
                                ? SizedBox(height: 30)
                                : SizedBox(
                                    height: 10,
                                  ),

                            // Password Requirements Indicator
                            if (!controller.isLogin.value) ...[
                              Obx(() => Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color:
                                            controller.isPasswordValidObs.value
                                                ? Colors.green
                                                : Colors.amber,
                                        size: 10,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        controller.isPasswordValidObs.value
                                            ? 'Password is safe'
                                            : 'Must at least 8 characters, and 1 uppercase',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 30),
                            ],

                            if (controller.isLogin.value) ...[
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword()));
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              )
                            ],

                            if (!controller.isLogin.value) ...[
                              // Confirm Password Field
                              Obx(() => TextFormField(
                                    controller:
                                        controller.confirmPasswordController,
                                    style: TextStyle(
                                      color: controller.isPasswordMismatch.value
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      fillColor: AppColors.White,
                                      filled: true,
                                      hintText: 'Confirm Password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color:
                                            controller.isPasswordMismatch.value
                                                ? Colors.red
                                                : (controller
                                                        .confirmPasswordText
                                                        .isNotEmpty
                                                    ? Colors.green
                                                    : Colors.grey),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  )),
                              SizedBox(height: 30),
                            ],

                            // Sign Up Button
                            Obx(() => Container(
                                  height: 50,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: controller.allFieldsFilled.value
                                        ? AppColors.DarkGreen
                                        : AppColors.LightGreen2,
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
                                      } else if (!passwordsMatch) {}
                                    },
                                    child: Text(
                                      !controller.isLogin.value
                                          ? 'Sign Up'
                                          : 'Login',
                                      style: TextStyle(
                                        color: controller.allFieldsFilled.value
                                            ? AppColors.White
                                            : AppColors.DarkGreen,
                                        fontWeight: FontWeight.bold,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
