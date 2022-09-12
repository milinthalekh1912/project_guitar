class CategoriesModel {
  String id;
  String title;
  bool updateStatus;
  List<SubcateInCateModel> subcatesId;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.updateStatus,
    required this.subcatesId,
  });

  factory CategoriesModel.fromjson(Map<String, dynamic> json) {
    var items = json['items'] as List;
    List<SubcateInCateModel> listSubcatesId =
        items.map((e) => SubcateInCateModel.fromJson(e)).toList();
    return CategoriesModel(
      id: json['id'],
      title: json['title'],
      updateStatus: json['updateStatus'],
      subcatesId: listSubcatesId,
    );
  }
}

class SubcateInCateModel {
  String id;
  String title;

  SubcateInCateModel({required this.id, required this.title});

  factory SubcateInCateModel.fromJson(Map<String, dynamic> json) {
    return SubcateInCateModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
