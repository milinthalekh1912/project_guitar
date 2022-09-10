import 'package:flutter/material.dart';
import 'package:form/service/config_object.dart';
import 'package:form/service/product_group_service/get_product_groups_model.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

List<ProductgroupsModel> departList = listProductgroupsOnDevice;// Values
late String selectedDepartment;

class Depratment extends StatefulWidget {
  const Depratment({super.key});

  @override
  State<Depratment> createState() => _DepratmentState();
}

class _DepratmentState extends State<Depratment> {
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
      width: width / 3,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: const Text('hint'),
          isExpanded: true,
          value: dropdownValue,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: (String? value) async {
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
  }
}
