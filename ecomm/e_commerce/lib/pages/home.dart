import 'package:e_commerce/model/data.dart';
import 'package:e_commerce/widgets/CardWidget.dart';
import 'package:e_commerce/widgets/PopUpMenu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> displayedProducts = Data.products;
  void updateFilteredProducts(List<Product> filteredProducts) {
    setState(() {
      displayedProducts =
          filteredProducts.isEmpty ? Data.products : filteredProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('E-commerce')),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 0.7,
              ),
              itemCount: displayedProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return cardWidget(displayedProducts[index]);
              },
            ),
          ),
          PopUpMenu(onFiltersApplied: updateFilteredProducts)
        ],
      ),
    );
  }
}
