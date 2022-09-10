import 'dart:convert';

class ProductCategories{
  String id;
  String title;
  bool updateStatus;
  //List<String> items;

  ProductCategories({
    required this.id,
    required this.title,
    required this.updateStatus,
    //required this.items,
  });

  factory ProductCategories.fromJson(Map<String,dynamic> json){
  // var list = json['items'] as List;
  return ProductCategories(
      id:json['id'] ,
      title: json['title'],
      updateStatus: json['updateStatus'],
      //items: [],
  );
  }
}