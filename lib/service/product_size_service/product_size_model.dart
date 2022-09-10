import 'dart:convert';

class ProductSizeModel {
  int productSizeID;
  String name;
  ProductSizeModel({required this.productSizeID, required this.name});

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) {
    return ProductSizeModel(
      productSizeID: json['productSizeID'],
      name: json['name'],
    );
  }
}

class ProductSizeListModel {
  List<ProductSizeModel> items;
  ProductSizeListModel({required this.items});

  factory ProductSizeListModel.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<ProductSizeModel> itemList =
        list.map((i) => ProductSizeModel.fromJson((i))).toList();
    return ProductSizeListModel(items: itemList);
  }
}
