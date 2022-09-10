
// ignore: non_constant_identifier_names
class SkuLookupBarcodeModel {
  String barcode;
  String sku;
  String title;
  double price;
  bool updateStatus;
  bool blueFlag;
  Map<String, dynamic> promotion;
  SkuLookupBarcodeModel({
    required this.barcode,
    required this.sku,
    required this.title,
    required this.price,
    required this.updateStatus,
    required this.blueFlag,
    required this.promotion,
  });

  factory SkuLookupBarcodeModel.fromJson(
      Map<String, dynamic> json) {
    String key = json.keys.first.toString();

    return SkuLookupBarcodeModel(
      barcode: key,
      sku: json.values.first['sku'],
      title: json.values.first['title'],
      price: json.values.first['price'].toDouble(),
      updateStatus: json.values.first['updateStatus'],
      blueFlag: json.values.first['blueFlag'],
      promotion: json.values.first['promotion']!,
    );
  }
}
