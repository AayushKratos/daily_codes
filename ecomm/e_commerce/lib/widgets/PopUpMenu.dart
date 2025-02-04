import 'package:e_commerce/model/data.dart';
import 'package:e_commerce/widgets/BuildFilter.dart';
import 'package:e_commerce/widgets/ColorCheckbox.dart';
import 'package:e_commerce/widgets/PriceSlider.dart';
import 'package:e_commerce/widgets/SizeCheckbox.dart';
import 'package:e_commerce/widgets/filterLabel.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  final Function(List<Product>) onFiltersApplied;
  const PopUpMenu({required this.onFiltersApplied});

  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  bool showSizes = true;
  bool showColor = false;
  bool showPrice = false;

  bool isSizeSelected = false;
  bool isColorSelected = false;
  bool isPriceSelected = false;

  List<Product> filteredProducts = Data.products;

  List<double> price =
      Data.products.map((product) => product.price).toSet().toList();
  List<ProductSize> sizes = ProductSize.values.toList();
  List<ProductColor> colors = ProductColor.values.toList();

  late List<bool> selectedSizes;
  late List<bool> selectedColors;
  late List<bool> selectedPrices;

  @override
  void initState() {
    super.initState();
    selectedSizes = List.generate(sizes.length, (index) => false);
    selectedColors = List.generate(colors.length, (index) => false);
    selectedPrices = List.generate(price.length, (index) => false);
  }

  double startPrice = Data.products[0].price;
  double endPrice = Data.products[Data.products.length - 1].price;

  void updateSelectionStatus() {
    setState(() {
      isSizeSelected = selectedSizes.contains(true);
      isColorSelected = selectedColors.contains(true);
      isPriceSelected = startPrice != Data.products[0].price.toDouble() ||
          endPrice != Data.products[Data.products.length - 1].price.toDouble();

      if (!isSizeSelected && !isColorSelected && !isPriceSelected) {
        filteredProducts = List.from(Data.products);
      }
    });
  }

  void resetFilters() {
    setState(() {
      startPrice = Data.products[0].price.toDouble();
      endPrice = Data.products[Data.products.length - 1].price.toDouble();
      showSizes = true;
      showColor = false;
      showPrice = false;
      selectedSizes = List.generate(sizes.length, (index) => false);
      selectedColors = List.generate(colors.length, (index) => false);
      selectedPrices = List.generate(price.length, (index) => false);
      updateSelectionStatus();
      widget.onFiltersApplied(Data.products);
    });
  }

  void applyFilters() {
    List<Product> tempProducts = Data.products.where((product) {
      bool matchesSize = true;
      bool matchesColor = true;
      bool matchesPrice =
          product.price >= startPrice && product.price <= endPrice;

      if (isSizeSelected) {
        matchesSize = false;
        for (int i = 0; i < selectedSizes.length; i++) {
          if (selectedSizes[i] && product.size == sizes[i].name) {
            matchesSize = true;
            break;
          }
        }
      }

      if (isColorSelected) {
        matchesColor = false;
        for (int i = 0; i < selectedColors.length; i++) {
          if (selectedColors[i] && product.color == colors[i].name) {
            matchesColor = true;
            break;
          }
        }
      }

      return matchesSize && matchesColor && matchesPrice;
    }).toList();

    setState(() {
      filteredProducts = tempProducts;
    });

    widget.onFiltersApplied(filteredProducts);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, setState) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Center(
                        child: Text('Filter Options',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              buildFilter(
                                  title: 'Size',
                                  isSelected: isSizeSelected,
                                  onTap: () {
                                    setState(() {
                                      showSizes = !showSizes;
                                      showColor = false;
                                      showPrice = false;
                                    });
                                  }),
                              buildFilter(
                                  title: 'Color',
                                  isSelected: isColorSelected,
                                  onTap: () {
                                    setState(() {
                                      showSizes = false;
                                      showColor = !showColor;
                                      showPrice = false;
                                    });
                                  }),
                              buildFilter(
                                  title: 'Price',
                                  isSelected: isPriceSelected,
                                  onTap: () {
                                    setState(() {
                                      showSizes = false;
                                      showColor = false;
                                      showPrice = !showPrice;
                                    });
                                  }),
                            ],
                          ),
                          Column(
                            children: [
                              if (showSizes)
                                SizeCheckBox(
                                  selectedSizes: selectedSizes,
                                  onSelectionChanged:
                                      (List<bool> newSelection) {
                                    setState(() {
                                      selectedSizes = newSelection;
                                      updateSelectionStatus();
                                    });
                                  },
                                ),
                              if (showColor)
                                ColorCheckBox(
                                  selectedColors: selectedColors,
                                  onSelectionChanged:
                                      (List<bool> newSelection) {
                                    setState(() {
                                      selectedColors = newSelection;
                                      updateSelectionStatus();
                                    });
                                  },
                                ),
                              if (showPrice)
                                PriceSlider(
                                  startPrice: startPrice,
                                  endPrice: endPrice,
                                  onSelectionChanged:
                                      (double start, double end) {
                                    setState(() {
                                      startPrice = start;
                                      endPrice = end;
                                      updateSelectionStatus();
                                    });
                                  },
                                ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              applyFilters();
                              Navigator.pop(context);
                            },
                            child: const Text('Apply Filters'),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20)),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                resetFilters();
                                Navigator.pop(context);
                              });
                            },
                            child: const Text('Reset Filters'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      label: filterLabel(),
    );
  }
}
