 import 'package:flutter/material.dart';
import 'package:form/service/config_object.dart';

 List<DropdownMenuItem> getDropdownItem()  {
    List<DropdownMenuItem> dropdownItem = [];
    for (var i = 0; i < listProductUnitOnDevice.length; i++) {
      String itemName = listProductUnitOnDevice[i].name;
      //  print(itemName);
      var dropdownUnitItem = DropdownMenuItem(
        value: itemName,
        child: Text(itemName),
      );
      dropdownItem.add(dropdownUnitItem);
    }
    return dropdownItem;
  }

List<DropdownMenuItem> getProductDropdownItem() {
    List<DropdownMenuItem> dropdownItem = [];
    for (var i = 0; i < listProductSizeOnDevice.length; i++) {
      String itemName = listProductSizeOnDevice[i].name;
      var dropdownUnitItem = DropdownMenuItem(
        value: itemName,
        child: Text(itemName),
      );
      dropdownItem.add(dropdownUnitItem);
    }
    return dropdownItem;
  }
  List<DropdownMenuItem> getDepratmentDropdownItem() {
    List<DropdownMenuItem> dropdownItem = [];
    for (var i = 0; i < listProductgroupsOnDevice.length; i++) {
      String itemName = listProductgroupsOnDevice[i].th_prodcat;
      var dropdownUnitItem = DropdownMenuItem(
        value: itemName,
        child: Text(itemName),
      );
      dropdownItem.add(dropdownUnitItem);
    }
    return dropdownItem;
  }