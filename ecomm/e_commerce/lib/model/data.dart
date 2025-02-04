enum ProductSize { S, M, L, XL }

enum ProductColor { Red, Green, Blue }

class Product {
  final String size;
  final String color;
  final double price;

  Product({required this.size, required this.color, required this.price});
}

class Data {
  static const String desc =
      "The fox in the tophat whispered into the ear of the rabbit.";

  static List<Product> products = [
    Product(size: ProductSize.S.name, color: ProductColor.Red.name, price: 100),
    Product(
        size: ProductSize.L.name, color: ProductColor.Green.name, price: 200),
    Product(
        size: ProductSize.M.name, color: ProductColor.Blue.name, price: 300),
    Product(size: ProductSize.XL.name, color: ProductColor.Red.name, price: 400)
  ];
}
