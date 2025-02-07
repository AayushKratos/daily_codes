import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Widget> options = <Widget>[
    Text('Inside'),
    Text('Outside'),
  ];
  List<bool> selectedOptions = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 28),
            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  constraints: const BoxConstraints(
                      minWidth: 50,
                      maxWidth: 140,
                      minHeight: 50,
                      maxHeight: 100),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Essentials to Get Glowing Skin',
                        style:
                            TextStyle(color: Color.fromRGBO(106, 106, 106, 1)),
                      ),
                      Text(
                        'Inside Out',
                        style:
                            TextStyle(color: Color.fromRGBO(146, 153, 100, 1)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ToggleButtons(
              isSelected: selectedOptions,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < selectedOptions.length; i++) {
                    selectedOptions[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              selectedBorderColor: const Color.fromRGBO(140, 147, 101, 1),
              selectedColor: Colors.white,
              fillColor: const Color.fromRGBO(140, 147, 101, 1),
              color: Colors.black,
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              children: options,
            ),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              child: selectedOptions[0]
                  ? InsideOption(key: const ValueKey<int>(1))
                  : OutsideOption(key: const ValueKey<int>(2)),
            ),
          ],
        ),
      ),
    );
  }
}

class OutsideOption extends StatelessWidget {
  const OutsideOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          fit: BoxFit.fill,
          'https://kapiva-gcp.gumlet.io/skin-pdp/images/1709550641076-glow-serum-fop.png',
          height: 280,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: 40,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              'Key Benefits',
              style: TextStyle(color: Color.fromRGBO(106, 106, 106, 1)),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Image.network(
          fit: BoxFit.fill,
          'https://kapiva-gcp.gumlet.io/skin-pdp/images/1709102033508-glow%20serum%20key%20benefits.jpg',
          height: 360,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: 40,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              'Ingredients',
              style: TextStyle(color: Color.fromRGBO(106, 106, 106, 1)),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Image.network(
          fit: BoxFit.fill,
          'https://kapiva-gcp.gumlet.io/skin-pdp/images/1709102864007-glow-serum-ingredients.jpg',
          height: 800,
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}

class InsideOption extends StatelessWidget {
  const InsideOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          fit: BoxFit.fill,
          'https://kapiva-gcp.gumlet.io/skin-pdp/images/1709550698835-glow-mix-fop.png',
          height: 280,
          width: 330,
        ),
        SizedBox(
          height: 40,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              'Key Benefits',
              style: TextStyle(color: Color.fromRGBO(106, 106, 106, 1)),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Image.network(
          fit: BoxFit.fill,
          'https://kapiva-gcp.gumlet.io/skin-pdp/images/1709541791742-glow%20mix%20key%20benefits%20(1).jpg',
          height: 360,
          width: 806,
        ),
        SizedBox(
          height: 40,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Text(
              'Ingredients',
              style: TextStyle(color: Color.fromRGBO(106, 106, 106, 1)),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Image.network(
          fit: BoxFit.fill,
          'https://kapiva-gcp.gumlet.io/skin-pdp/images/1709543252481-glow-mix-ingredients.jpg',
          height: 800,
          width: 1200,
        )
      ],
    );
  }
}
