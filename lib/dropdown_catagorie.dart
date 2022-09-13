import 'package:flutter/material.dart';
import 'package:form/getservicedropdown.dart';

import 'service/config_object.dart';

// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Catagorie extends StatefulWidget {
  Catagorie({super.key});

  @override
  State<Catagorie> createState() => _CatagorieState();
}

class _CatagorieState extends State<Catagorie> {
  String dropdownValue = listProductcategoriesOnDevice[0].title;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  String textSend;
    //  textString(textSend);
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
          isExpanded: true,
          value: dropdownValue,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            //  print(value);
            setState(() {
              dropdownValue = value;
              subCat();
            });
          },
          items: getCatagorieDropdownItem(),
        ),
      ),
    );
  }
}
