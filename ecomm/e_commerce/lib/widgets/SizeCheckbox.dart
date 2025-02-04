import 'package:e_commerce/model/data.dart';
import 'package:flutter/material.dart';

class SizeCheckBox extends StatelessWidget {
  final List<bool> selectedSizes;
  final Function(List<bool>) onSelectionChanged;

  SizeCheckBox({required this.selectedSizes, required this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    var sizes = ProductSize.values.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        sizes.length,
        (index) => Row(
          children: [
            Checkbox(
              value: selectedSizes[index],
              onChanged: (bool? value) {
                List<bool> newSelection = List.from(selectedSizes);

                newSelection[index] = value!;

                onSelectionChanged(newSelection);
              },
            ),
            Text(sizes[index].toString().split('.').last),
          ],
        ),
      ),
    );
  }
}
