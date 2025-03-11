import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terez/Provider/set_up_provider.dart';
import 'package:terez/pages/Create_Secure_Pin.dart';
import 'package:terez/styling/App_Colors.dart';

class SetUpProfile extends StatefulWidget {
  const SetUpProfile({super.key});

  @override
  State<SetUpProfile> createState() => _SetUpProfileState();
}

class _SetUpProfileState extends State<SetUpProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => SetUpProvider(),
      child: Consumer<SetUpProvider>(builder: (context, provider, child) {
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
                      const SizedBox(height: 50),
                      const Text('Let’s Setting Up Your Fresh Account'),
                      const SizedBox(height: 50),
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 326,
                            decoration: BoxDecoration(
                              color: AppColors.DarkGreen2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Icon(Icons.tag),
                                  SizedBox(width: 10),
                                  Text('Balance'),
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
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "\$1,550.20",
                                    style: TextStyle(fontSize: 38),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Your Full Name'),
                                      Text('Your Phone Number'),
                                    ],
                                  )
                                ],
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
                    height: screenHeight * 0.55,
                    decoration: BoxDecoration(
                      color: AppColors.LightGreen,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: provider.fullNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter full name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_outline,
                                  color: Colors.grey),
                              hintText: 'Full Name',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: provider.phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter phone number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone_outlined,
                                  color: Colors.grey),
                              hintText: 'Phone Number',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: provider.recoveryEmailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter recovery email';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_outlined,
                                  color: Colors.grey),
                              hintText: 'Recovery Email',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState != null) {
                                  bool isValid =
                                      _formKey.currentState!.validate();

                                  if (isValid) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateSecurePin()),
                                    );
                                  } else {
                                    return;
                                  }
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.LightGreen3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                'Continue',
                                style: TextStyle(color: AppColors.DarkGreen),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
