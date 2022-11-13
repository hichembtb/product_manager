class ProductModel {
  final String name;
  final double price;
  final double stock;

  ProductModel({
    required this.name,
    required this.price,
    required this.stock,
  });
  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      // * frontend Var
      name: data['name'],
      price: data['price'],
      stock: data['stock'],
    );
  }
}
