import 'dart:convert';

class ProductCategoriesModel{
  String id;
  String title;
  bool updateStatus;
  List<String> items;

  ProductCategoriesModel({
    required this.id,
    required this.title,
    required this.updateStatus,
    required this.items,
  });

  factory ProductCategoriesModel.fromJson(Map<String,dynamic> json){
  var list = json['items'] as List;
  return ProductCategoriesModel(
      id:json['id'] ,
      title: json['title'],
      updateStatus: json['updateStatus'],
      items: [],
  );
  }
}