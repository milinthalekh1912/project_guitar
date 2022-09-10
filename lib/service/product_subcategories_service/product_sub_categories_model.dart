import 'dart:convert';

class ProductSubCategoriesModel{
  String id;
  String title;
  bool updateStatus;
  List<String> items;

  ProductSubCategoriesModel({
    required this.id,
    required this.title,
    required this.updateStatus,
    required this.items,
  });

  factory ProductSubCategoriesModel.fromJson(Map<String,dynamic> json){
  var list = json['itemsId'] as List;
  List<String> itemList = list.map((e) => e.toString()).toList();
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
      id: json['id'],
      title: json['title'],
    );
  }
}