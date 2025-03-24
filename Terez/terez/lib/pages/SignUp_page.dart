import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terez/Provider/sign_up_provider.dart';
import 'package:terez/pages/Forgot_Password.dart';
import 'package:terez/pages/Set_up_Profile.dart';
import 'package:terez/styling/App_Colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: Consumer<SignUpProvider>(
        builder: (context, provider, child) {
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
                          height: provider.isSignIn
                              ? screenHeight * 0.15
                              : screenHeight * 0.1,
                        ),
                        Text(provider.isSignIn
                            ? 'Welcome Back!'
                            : 'Hey, Welcome!'),
                        SizedBox(height: 20),
                        Text(provider.isSignIn
                            ? 'Enter your account details to continue'
                            : 'Let’s create your new account!'),
                        SizedBox(height: 40),
                        Container(
                          alignment: Alignment.center,
                          width: 325,
                          height: 62,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.DarkGreen2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    provider.toggleSignIn(false);
                                    provider.refreshForm();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: provider.isSignIn
                                          ? Colors.transparent
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: provider.isSignIn
                                            ? Colors.white
                                            : AppColors.DarkGreen,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    provider.toggleSignIn(true);
                                    provider.refreshForm();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: provider.isSignIn
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: provider.isSignIn
                                            ? AppColors.DarkGreen
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: provider.isSignIn
                          ? screenHeight * 0.45
                          : screenHeight * 0.65,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: AppColors.LightGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: provider.isSignIn ? 60 : 40),
                              TextFormField(
                                controller: provider.emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter email ID';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email Address',
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color:
                                        provider.emailController.text.isNotEmpty
                                            ? AppColors.DarkGreen
                                            : Colors.grey,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              if (!provider.isSignIn) ...[
                                TextFormField(
                                  controller: provider.usernameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter username';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    prefixIcon: Icon(
                                      Icons.person_2_outlined,
                                      color: provider.usernameController.text
                                              .isNotEmpty
                                          ? AppColors.DarkGreen
                                          : Colors.grey,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: provider.passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter created password';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Create Password',
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: provider.passwordController.text
                                                .isNotEmpty
                                            ? AppColors.DarkGreen
                                            : Colors.grey,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    obscureText: true,
                                  ),
                                  SizedBox(height: 10),
                                  if (!provider.isSignIn) ...[
                                    ValueListenableBuilder<bool>(
                                      valueListenable:
                                          provider.isPasswordSafeNotifier,
                                      builder: (context, isSafe, child) {
                                        return Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: isSafe
                                                  ? Colors.green
                                                  : Colors.amber,
                                              size: 10,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              isSafe
                                                  ? 'Password is Safe'
                                                  : 'Must be at least 8 characters, and 1 uppercase',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ]
                                ],
                              ),
                              SizedBox(height: 30),
                              if (provider.isSignIn) ...[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPassword()));
                                      },
                                      child: Text(
                                        'Forgot password?',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                )
                              ],
                              if (!provider.isSignIn) ...[
                                TextFormField(
                                  controller:
                                      provider.confirmPasswordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter confirmed password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Icon(Icons.lock_outline),
                                    prefixIconColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  obscureText: true,
                                ),
                                SizedBox(height: 30),
                              ],
                              TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState != null) {
                                      bool isValid =
                                          _formKey.currentState!.validate();

                                      if (isValid) {
                                        if (!provider.isSignIn &&
                                            provider.passwordController.text !=
                                                provider
                                                    .confirmPasswordController
                                                    .text) {
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SetUpProfile()),
                                          );
                                        }
                                      }
                                    }
                                  },
                                  child: ValueListenableBuilder(
                                      valueListenable:
                                          provider.isFormFilledNotifier,
                                      builder: (context, isFormFilled, _) {
                                        return Container(
                                          height: 50,
                                          width: 325,
                                          decoration: BoxDecoration(
                                            color: isFormFilled
                                                ? AppColors.DarkGreen
                                                : AppColors.LightGreen3,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                            child: Text(
                                              provider.isSignIn
                                                  ? 'Login'
                                                  : 'Sign Up',
                                              style: TextStyle(
                                                color: isFormFilled
                                                    ? Colors.white
                                                    : AppColors.DarkGreen,
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
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
        },
      ),
    );
  }
}
