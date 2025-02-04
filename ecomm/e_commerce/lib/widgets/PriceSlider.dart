import 'package:e_commerce/model/data.dart';
import 'package:flutter/material.dart';

class PriceSlider extends StatefulWidget {
  final double startPrice;
  final double endPrice;
  final Function(double, double) onSelectionChanged;

  PriceSlider(
      {required this.startPrice,
      required this.endPrice,
      required this.onSelectionChanged});

  @override
  _PriceSliderState createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  late double _startPrice;
  late double _endPrice;

  List<double> price =
      Data.products.map((product) => product.price).toSet().toList();

  @override
  void initState() {
    super.initState();
    _startPrice = widget.startPrice;
    _endPrice = widget.endPrice;
  }

  @override
  Widget build(BuildContext context) {
    price.sort();

    if (price.isEmpty) {
      return Center(child: Text('No products available'));
    }

    return Column(
      children: [
        RangeSlider(
          values: RangeValues(_startPrice, _endPrice),
          min: price.first,
          max: price.last,
          divisions: price.length - 1,
          labels: RangeLabels(
            _startPrice.toStringAsFixed(2),
            _endPrice.toStringAsFixed(2),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _startPrice = values.start;
              _endPrice = values.end;
              widget.onSelectionChanged(_startPrice, _endPrice);

              print('${_startPrice} ========= ${_endPrice}');
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_startPrice.toStringAsFixed(2)} - ${_endPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
