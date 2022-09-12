import 'dart:convert';

class SkuPriceModel {
  String sku;
  double price;

  SkuPriceModel({
    required this.sku,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "sku": sku,
      "price": price,
    };
  }
}

class SkuPricePatchModel {
  List<SkuPriceModel> items;
  SkuPricePatchModel({required this.items});

  toJson() {
    var listItem = items.toList();
    return {
      jsonEncode(listItem),
    };
  }
}
