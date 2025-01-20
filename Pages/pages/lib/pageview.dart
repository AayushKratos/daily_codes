import 'dart:ui';

import 'package:flutter/material.dart';

class pageView extends StatefulWidget {
  const pageView({super.key});

  @override
  State<pageView> createState() => _pageViewState();
}

class _pageViewState extends State<pageView> {
  final Data data = Data();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.002),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03)),
              Center(
                  child: Text(
                Data.journey,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenHeight * 0.015)),
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.845,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Image.asset(
                        'assests/image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.7)),
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.12),
                            width: 2, // Width of the line
                            height: 30, // Height of the line
                            // color: Colors
                            //     .white, // Color of the line (adjust to match your design)
                            decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white, // Start color
                                  Colors.grey, // Middle color
                                  Colors.black, // End color
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.004)),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Text(
                                  data.months['month1'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03)),
                              Expanded(
                                child: Text(
                                  data.months_data['month1'],
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.018)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.12),
                            width: 2, // Width of the line
                            height: 30, // Height of the line
                            // color: Colors
                            //     .white, // Color of the line (adjust to match your design)
                            decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white, // Start color
                                  Colors.grey, // Middle color
                                  Colors.black, // End color
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.004)),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Text(
                                  data.months['month2'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03)),
                              Expanded(
                                child: Text(
                                  data.months_data['month2'],
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),

                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.018)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.12),
                            width: 2, // Width of the line
                            height: 30, // Height of the line
                            // color: Colors
                            //     .white, // Color of the line (adjust to match your design)
                            decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white, // Start color
                                  Colors.grey, // Middle color
                                  Colors.black, // End color
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.004)),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Text(
                                  data.months['month3'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03)),
                              Expanded(
                                child: Text(
                                  data.months_data['month3'],
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.11,
                            right: screenWidth * 0.03),
                        child: CustomPaint(
                          size: const Size(
                              250, 90), // Width and height of the canvas
                          painter: CurvedLinePainter(),
                        ),
                      ),
                      // Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         vertical: screenHeight * 0.03)),
                      Text(
                        Data.three_months,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.11,
                            right: screenWidth * 0.03),
                        child: CustomPaint(
                          size: const Size(
                              250, 80), // Width and height of the canvas
                          painter: CurvedLinePainter2(),
                        ),
                      ),
                      Text(
                        Data.continue_drinking,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.12),
                          width: 2, // Width of the line
                          height: 30, // Height of the line
                          // color: Colors
                          //     .white, // Color of the line (adjust to match your design)
                          decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                              colors: [
                                Colors.white, // Start color
                                Colors.grey, // Middle color
                                Colors.black, // End color
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: Text(
                            data.months['month6'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01)),
                      Text(
                        Data.consume,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02))
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint
    final Paint paint = Paint()
      ..color = Colors.grey // Line color
      ..strokeWidth = 2.0 // Line thickness
      ..style = PaintingStyle.stroke // Stroke style
      ..strokeCap = StrokeCap.round; // Rounded ends

    // Define the path
    final Path path = Path()
      ..moveTo(2, size.height - 75) // Start at the left middle
      ..quadraticBezierTo(
        size.height / 30, size.height * 0.5, // Control point for the curve
        size.width * 0.098, size.height / 2, // End point of the first curve
      )
      ..lineTo(size.width * 0.85, size.height / 2) //Straight line

      // // ..moveTo(2, size.height + 80)
      // ..quadraticBezierTo(size.width * 0.098, size.height * 2, size.width * 1,
      //     size.height - 20);
      ..quadraticBezierTo(
        size.width * 0.98, size.height / 2, // Control point for the curve
        size.width * 1, size.height - 20, // End point of the second curve
      );

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No repainting needed for static lines
  }
}

class CurvedLinePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint
    final Paint paint = Paint()
      ..color = Colors.grey // Line color
      ..strokeWidth = 2.0 // Line thickness
      ..style = PaintingStyle.stroke // Stroke style
      ..strokeCap = StrokeCap.round; // Rounded ends

    // Define the path
    final Path path = Path()
      ..moveTo(size.width - 20, size.height / 2) // Start at the left middle
      ..quadraticBezierTo(
        0, size.height * 0.5, // Control point for the curve
        size.width * 0.1, size.height / 2, // End point of the first curve
      )
      ..moveTo(size.width, size.height / 6) // Start at the right-middle
      ..quadraticBezierTo(
        size.width * 1, size.height * 0.5, // Control point above
        size.width * 0.9, size.height / 2, // End point of the curve
      )
      // ..lineTo(size.width * 0.85, size.height / 2) //Straight line
      ..moveTo(5, size.height - 10)
      ..quadraticBezierTo(
        size.height / 40, size.height * 0.5, // Control point for the curve
        size.width * 0.1, size.height / 2, // End point of the first curve
      );

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No repainting needed for static lines
  }
}

class Data {
  Map months_data = {
    'month1': 'Improved Digestion & Constipation Relief',
    'month2': 'Improvement in Energy Levels',
    'month3': 'Reduced Blood Sugar Levels'
  };

  static const String journey =
      'The 3-Months Journey To\nLower Blood Sugar Levels';
  static const String three_months = '3 - 6 Months';
  static const String continue_drinking =
      'Continue drinking 2 times daily for more improvement in HbA1c levels';
  static const String consume =
      'Consume once daily to maintain health benefits';

  Map months = {
    'month1': 'Month 1',
    'month2': 'Month 2',
    'month3': 'Month 3',
    'month6': 'After 6 Months '
  };
}
