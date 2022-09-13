import 'package:flutter/material.dart';

import 'getservicedropdown.dart';
import 'service/config_object.dart';

class SubCatagorie extends StatefulWidget {
  const SubCatagorie({super.key});

  @override
  State<SubCatagorie> createState() => _SubCatagorieState();
}

class _SubCatagorieState extends State<SubCatagorie> {
  String dropdownValue = listProductSubCategoriesModel[0].title;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future a = subCat();
  }

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: Colors.amber,
          border: Border.all(
            width: 1,
          )),
      height: 50,
      width: width / 3,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: const Text('เลือก'),
          // isExpanded: true,
          value: dropdownValue,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            print(value);
            setState(() {
              dropdownValue = value!;
            });
          },
          items: subCat(),
        ),
      ),
    );
  }
}
