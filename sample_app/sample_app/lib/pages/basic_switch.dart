import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 50)),
          Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = !isSwitched;
                });
              }),
          Column(
            children: [
              isSwitched
                  ? Column(
                      children: [
                        Image.network(
                          'https://imgs.search.brave.com/Ko_poikgqq4j6Vq0S-ys0oudD6BVC1qFxzB6SdHYtTk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTMz/MzMyNzk4OS9waG90/by9yZWQtY2FzaW5v/LXNheXMuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPTJnWWx6/VVJlU1FSdmVUS0U5/WHlFTlRmV0tadDRD/WWpnY0ZQdnQzTW9U/eUU9',
                          height: 200,
                        ),
                        Image.network(
                          'https://imgs.search.brave.com/Ko_poikgqq4j6Vq0S-ys0oudD6BVC1qFxzB6SdHYtTk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTMz/MzMyNzk4OS9waG90/by9yZWQtY2FzaW5v/LXNheXMuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPTJnWWx6/VVJlU1FSdmVUS0U5/WHlFTlRmV0tadDRD/WWpnY0ZQdnQzTW9U/eUU9',
                          height: 200,
                        ),
                        Image.network(
                          'https://imgs.search.brave.com/Ko_poikgqq4j6Vq0S-ys0oudD6BVC1qFxzB6SdHYtTk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTMz/MzMyNzk4OS9waG90/by9yZWQtY2FzaW5v/LXNheXMuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPTJnWWx6/VVJlU1FSdmVUS0U5/WHlFTlRmV0tadDRD/WWpnY0ZQdnQzTW9U/eUU9',
                          height: 200,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Image.network(
                          'https://imgs.search.brave.com/60xvQAPt0_zRbLpL4z8LpUhLlGHRFKMXkdHIZVfKDT0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTM4/NzgzNzYyMy9waG90/by90b3Atc2NvcmUt/cGFpci1vZi1kaWNl/LXNob3ctZG91Ymxl/LXNpeC1yZXByZXNl/bnRpbmctZ29vZC1s/dWNrLmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1jRGZpSUM3/Vkdtc3pLRW5KeE1w/bnJMR0FXem9jNTN2/R3draUlmaGJoeG1r/PQ',
                          height: 200,
                        ),
                        Image.network(
                          'https://imgs.search.brave.com/60xvQAPt0_zRbLpL4z8LpUhLlGHRFKMXkdHIZVfKDT0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTM4/NzgzNzYyMy9waG90/by90b3Atc2NvcmUt/cGFpci1vZi1kaWNl/LXNob3ctZG91Ymxl/LXNpeC1yZXByZXNl/bnRpbmctZ29vZC1s/dWNrLmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1jRGZpSUM3/Vkdtc3pLRW5KeE1w/bnJMR0FXem9jNTN2/R3draUlmaGJoeG1r/PQ',
                          height: 200,
                        ),
                        Image.network(
                          'https://imgs.search.brave.com/60xvQAPt0_zRbLpL4z8LpUhLlGHRFKMXkdHIZVfKDT0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTM4/NzgzNzYyMy9waG90/by90b3Atc2NvcmUt/cGFpci1vZi1kaWNl/LXNob3ctZG91Ymxl/LXNpeC1yZXByZXNl/bnRpbmctZ29vZC1s/dWNrLmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1jRGZpSUM3/Vkdtc3pLRW5KeE1w/bnJMR0FXem9jNTN2/R3draUlmaGJoeG1r/PQ',
                          height: 200,
                        )
                      ],
                    )
            ],
          )
        ],
      ),
    ));
  }
}
