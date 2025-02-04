import 'package:e_commerce/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget cardWidget(Product product) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 150,
            child: SvgPicture.asset(
              'assets/tshirt_svg.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.blue, BlendMode.colorBurn),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Size: ${product.size}',
          ),
          const SizedBox(height: 5),
          Text(
            'Color: ${product.color}',
          ),
          const SizedBox(height: 5),
          Text(
            Data.desc,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            'Rs. ${product.price}',
          ),
        ],
      ),
    ),
  );
}
