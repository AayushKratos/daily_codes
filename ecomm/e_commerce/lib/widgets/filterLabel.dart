import 'package:flutter/material.dart';

class filterLabel extends StatelessWidget {
  const filterLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.filter_alt_outlined,
          size: 20,
        ),
        Text(
          'Filter',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
