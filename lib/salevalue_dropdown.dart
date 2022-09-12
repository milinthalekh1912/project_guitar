import 'package:flutter/material.dart';
import 'package:form/getservicedropdown.dart';

import 'service/config_object.dart';

class SaleValue extends StatefulWidget {
  const SaleValue({super.key});

  @override
  State<SaleValue> createState() => _SaleValueState();
}

class _SaleValueState extends State<SaleValue> {
  String dropdownValue = listProductUnitOnDevice[0].name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDropdownItem();
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
        child: DropdownButtonFormField(
          hint: const Text('เลือก'),
          // isExpanded: true,
          value: dropdownValue,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          items: getDropdownItem(),
          onChanged: (value) {
            print(value);

            setState(() {
              dropdownValue = value;
            });
          },
        ),
      ),
    );
  }
}
