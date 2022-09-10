class ProductUnitModel {
  int productUnitID;
  String name;

  ProductUnitModel({
    required this.productUnitID,
    required this.name,
  });

  factory ProductUnitModel.fromJson(Map<String, dynamic> json) {
    return ProductUnitModel(
      productUnitID: json['productUnitID'],
      name: json['name'],
    );
  }
}

class ProductUnitListModel {
  List<ProductUnitModel> items;
  ProductUnitListModel({required this.items});

  factory ProductUnitListModel.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<ProductUnitModel> itemList =
        list.map((i) => ProductUnitModel.fromJson(i)).toList();
    return ProductUnitListModel(items: itemList);
  }
}
