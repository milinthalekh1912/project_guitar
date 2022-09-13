import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form/service/config_object.dart';

List<DropdownMenuItem> getDropdownItem() {
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

//Catagorie
var catg;
List<DropdownMenuItem> getCatagorieDropdownItem() {
  List<DropdownMenuItem> dropdownItem = [];
  for (var i = 0; i < listProductcategoriesOnDevice.length; i++) {
    String itemName = listProductcategoriesOnDevice[i].title;
    // print(itemName);
    var dropdownUnitItem = DropdownMenuItem(
      value: itemName,
      child: Text(itemName),
      onTap: () {
        if (itemName == itemName) {
        catg = itemName;
        subCat();
        }
        else{
          subCat();
        }
        
      },
    );
    dropdownItem.add(dropdownUnitItem);
  }
  return dropdownItem;
}

String? textName;
String? textString(String name) {
  textName = name;

  return textName;
}

String value = textName.toString();

List<DropdownMenuItem> subCat() {
  print('value data :' + catg);
  List<DropdownMenuItem> dropdownItem = [];
  for (var element in listProductcategoriesOnDevice) {
    if (element.title == catg) {
      for (var i = 0; i < element.items.length; i++) {
        // print(itemSubId);
        String itemSubName = listProductSubCategoriesModel[i].title;
        String itemSubId = listProductSubCategoriesModel[i].id;

        print('resulte'+itemSubName);
        var dropdownUnitItem = DropdownMenuItem(
          value: itemSubName,
          child: Text(itemSubName),
        );
        dropdownItem.add(dropdownUnitItem);
      }
    }
  }
  return dropdownItem;
}
