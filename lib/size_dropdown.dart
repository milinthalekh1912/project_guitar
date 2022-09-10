import 'package:flutter/material.dart';

const List<String> list = <String>['มล.', 'มก.', 'กรัม', 'ลิตร'];

class SizeValue extends StatefulWidget {
  const SizeValue({super.key});

  @override
  State<SizeValue> createState() => _SizeValueState();
}

class _SizeValueState extends State<SizeValue> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
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
      width: 100,
      // height: 0,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: const Text('hint'),
          // isExpanded: true,
          value: dropdownValue,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: (String? value) {
            // print(value?.indexOf(value!));
            print(value);
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
    ;
  }
}
