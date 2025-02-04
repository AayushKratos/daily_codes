import 'package:e_commerce/model/data.dart';
import 'package:flutter/material.dart';

class ColorCheckBox extends StatelessWidget {
  final List<bool> selectedColors;
  final Function(List<bool>) onSelectionChanged;

  ColorCheckBox(
      {required this.selectedColors, required this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    var colors = ProductColor.values.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        colors.length,
        (index) => Row(
          children: [
            Checkbox(
              value: selectedColors[index],
              onChanged: (bool? value) {
                List<bool> newSelection = List.from(selectedColors);
                newSelection[index] = value!;

                onSelectionChanged(newSelection);
              },
            ),
            Text(colors[index].toString().split('.').last),
          ],
        ),
      ),
    );
  }
}
