import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Dropdown extends StatefulWidget {
  // final List<dynamic> itemList;
  // final String hint;
  Dropdown({
    super.key,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Colors.amber,
            border: Border.all(
              width: 1,
            )),
        width: 300,
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
      ),
    );
  }
}
