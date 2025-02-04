import 'package:flutter/material.dart';

class buildFilter extends StatelessWidget {
  const buildFilter({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onTap,
          child: Row(
            children: [
              Text(title, style: TextStyle(fontSize: 15)),
              SizedBox(width: 5),
              if (isSelected)
                Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 10,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
