import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terez/Provider/forgot_password_provider.dart';
import 'package:terez/styling/App_Colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordProvider(),
      child: Consumer(builder: (context, provider, child) {
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
                  decoration: BoxDecoration(
                    color: AppColors.DarkGreen,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text('Don’t Worry, Let’s Create Your New Password'),
                      SizedBox(
                        height: 50,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 326,
                            decoration: BoxDecoration(
                                color: AppColors.DarkGreen2,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.tag),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('Password')
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              left: 10,
                              right: 10,
                              child: Container(
                                height: 120,
                                width: 314,
                                decoration: BoxDecoration(
                                  color: AppColors.LightGreen4,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 35, horizontal: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      fillColor: AppColors.LightGreen3,
                                      filled: true,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ))
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
                      height: screenHeight * 0.45,
                      decoration: BoxDecoration(
                          color: AppColors.LightGreen,
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.person_outline,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Username',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              )
                            ],
                          )),
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
