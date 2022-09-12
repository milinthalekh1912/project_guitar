class SubcategoriesModel {
  String id;
  String title;
  bool updateStatus;
  List<ItemsInSubecateModel> subcatesId;

  SubcategoriesModel({
    required this.id,
    required this.title,
    required this.updateStatus,
    required this.subcatesId,
  });

  factory SubcategoriesModel.fromjson(Map<String, dynamic> json) {
    var items = json['items'] as List;
    List<ItemsInSubecateModel> listSubcatesId =
        items.map((e) => ItemsInSubecateModel.fromJson(e)).toList();
    return SubcategoriesModel(
      id: json['id'],
      title: json['title'],
      updateStatus: json['updateStatus'],
      subcatesId: listSubcatesId,
    );
  }
}

class ItemsInSubecateModel {
  String id;
  String title;

  ItemsInSubecateModel({required this.id, required this.title});

  factory ItemsInSubecateModel.fromJson(Map<String, dynamic> json) {
    return ItemsInSubecateModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
