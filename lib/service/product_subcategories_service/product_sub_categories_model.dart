import 'dart:convert';

class ProductSubCategoriesModel{
  String id;
  String title;
  bool updateStatus;
  List<ItemModel> items;

  ProductSubCategoriesModel({
    required this.id,
    required this.title,
    required this.updateStatus,
    required this.items,
  });

  factory ProductSubCategoriesModel.fromJson(Map<String,dynamic> json){
  var list = json['items'] as List;
  List<ItemModel> itemList = list.map((e) => ItemModel.fromJson(e)).toList();
  return ProductSubCategoriesModel(
      id:json['id'] ,
      title: json['title'],
      updateStatus: json['updateStatus'],
      items: itemList,
  );
  }
}

class ItemModel{
  String id;
  String title;

  ItemModel({
    required this.id,
    required this.title,
  });

  factory ItemModel.fromJson(Map<String,dynamic> json){
  return ItemModel(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
    );
  }
}