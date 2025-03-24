import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:terez/styling/App_Colors.dart';

class CreateSecurePin extends StatefulWidget {
  const CreateSecurePin({super.key});

  @override
  State<CreateSecurePin> createState() => _CreateSecurePinState();
}

class _CreateSecurePinState extends State<CreateSecurePin> {
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
                    height: 50,
                  ),
                  Text('Create a Secure PIN for your  Teroz Account'),
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
                                width: 10,
                              ),
                              Text('Security')
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          left: 10,
                          child: Container(
                            height: 125,
                            width: 314,
                            decoration: BoxDecoration(
                                color: AppColors.LightGreen4,
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: PinCodeTextField(
                              appContext: context,
                              length: 6,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.circle,
                                  fieldHeight: 40,
                                  fieldWidth: 20,
                                  activeColor: Colors.white,
                                  activeFillColor: Colors.white,
                                  inactiveColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  selectedColor: Colors.white,
                                  inactiveFillColor: Colors.white),
                              animationDuration: Duration(milliseconds: 300),
                              enableActiveFill: true,
                              keyboardType: TextInputType.numberWithOptions(),
                              obscureText: true,
                              obscuringCharacter: '*',
                              textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.amber,
                              ),
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
                  height: screenHeight * 0.55,
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
                        PinCodeTextField(
                          appContext: context,
                          length: 6,
                          enableActiveFill: true,
                          enabled: false,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              disabledColor: Colors.white,
                              inactiveFillColor: Colors.white,
                              inactiveColor: Colors.white,
                              fieldHeight: 50,
                              fieldWidth: 40,
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.amber,
                              size: 10,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Please don’t use “123456”')
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.amber,
                              size: 10,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                'Avoid generic numbers like “222222” or “000000”')
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.amber,
                              size: 10,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                'Don’t use your birhtday date as a PIN numbers')
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              height: 50,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                  color: AppColors.DarkGreen,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                'Continue',
                                style: TextStyle(color: Colors.white),
                              )),
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
