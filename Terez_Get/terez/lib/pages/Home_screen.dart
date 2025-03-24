import 'package:flutter/material.dart';
import 'package:terez/colors/App_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _navIcon(IconData icon, {bool isActive = false}) {
    return Icon(
      icon,
      color: isActive ? AppColors.DarkGreen : Colors.grey.shade400,
      size: 28,
    );
  }

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
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    Text('Balance'),
                    SizedBox(
                      height: 30,
                    ),
                    Text('\$1820.25'),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 52,
                          width: 131,
                          decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.65,
                width: screenWidth,
                decoration: BoxDecoration(
                    color: AppColors.LightGreen,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('Quick Send'),
                    SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 52,
                            width: 130,
                            margin: EdgeInsets.only(
                                right:
                                    10), // Add some spacing between items if needed
                            decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 52,
                            width: 130,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 52,
                            width: 130,
                            decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 52,
                            width: 130,
                            margin: EdgeInsets.only(
                                right:
                                    10), // Add some spacing between items if needed
                            decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 52,
                            width: 130,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 52,
                            width: 130,
                            decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 52,
                            width: 130,
                            decoration: BoxDecoration(
                              color: AppColors.LightGreen2,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 38,
                                  backgroundColor: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text('Transactions'),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 52,
                      width: 327,
                      decoration: BoxDecoration(
                          color: AppColors.White,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.arrow_upward,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 20),
                              Text('Transfer')
                            ],
                          ),
                          Text('-\$20.00')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 52,
                      width: 327,
                      decoration: BoxDecoration(
                          color: AppColors.White,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.arrow_downward,
                                color: AppColors.DarkGreen,
                              ),
                              SizedBox(width: 20),
                              Text('Top Up')
                            ],
                          ),
                          Text('+\$50.00')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 145,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _navIcon(Icons.dashboard, isActive: true),
                                _navIcon(Icons.trending_up),
                                _navIcon(Icons.notifications_none),
                                _navIcon(Icons.person_outline),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
