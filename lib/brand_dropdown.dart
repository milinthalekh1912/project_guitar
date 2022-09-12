import 'package:flutter/material.dart';
import 'package:form/service/config_object.dart';

// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Brand extends StatefulWidget {
  const Brand({super.key});

  @override
  State<Brand> createState() => _BrandState();
}

class _BrandState extends State<Brand> {
  late List<String> data;
  List<String> getBrandItem() {
    List<String> listBrandItem = [];
    for (var i = 0; i < listBrandOnDevice.length; i++) {
      String brandItem = listBrandOnDevice[i].tH_Brand;
      listBrandItem.add(brandItem);
    }
    // print(listBrandItem);
    return listBrandItem;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBrandItem();
  }

  @override
  Widget build(BuildContext context) {
    // String dropdownValue = list.first;
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    data = getBrandItem();
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: Colors.amber,
          border: Border.all(
            width: 1,
          )),
      height: 50,
      width: width / 4,
      child: Autocomplete(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return data.where((value) {
            return value.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (selection) {
          debugPrint(selection);
        },
      ),
    );
  }
}
