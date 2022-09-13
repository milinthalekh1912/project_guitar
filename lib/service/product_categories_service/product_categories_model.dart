class ProductCategoriesModel {
  String id;
  String title;
  bool updateStatus;
  List<SubcateInCateModel> subcates;

  ProductCategoriesModel({
    required this.id,
    required this.title,
    required this.updateStatus,
    required this.subcates,
  });

  factory ProductCategoriesModel.fromJson(Map<String, dynamic> json) {
    var list = json['subcates'] as List;
    List<SubcateInCateModel> subcateList =
        list.map((e) => SubcateInCateModel.fromJson(e)).toList();
    return ProductCategoriesModel(
      id: json['id'],
      title: json['title'],
      updateStatus: json['updateStatus'],
      subcates: subcateList,
    );
  }
}

class SubcateInCateModel {
  String id;
  String title;

  SubcateInCateModel({
    required this.id,
    required this.title,
  });

  factory SubcateInCateModel.fromJson(Map<String, dynamic> json) {
    return SubcateInCateModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
    );
  }
}
