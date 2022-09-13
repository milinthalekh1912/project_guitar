import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form/service/config_object.dart';
import 'package:form/service/product_categories_service/product_categories_model.dart';

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
  for (var i = 0; i < listProductGroupsOnDevice.length; i++) {
    String itemName = listProductGroupsOnDevice[i].th_prodcat;
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
List<String> extractCategoriesTitle() {
  List<String> categoriesTitle = [];
  for(ProductCategoriesModel category in listProductCategoriesOnDevice) {
    categoriesTitle.add(category.title);
  }
  return categoriesTitle;
}

String? textName;
String? textString(String name) {
  textName = name;

  return textName;
}

String value = textName.toString();

List<String> extractSubcategoriesTitle(String categoryTitle) {
  List<String> titles = [];
  for(ProductCategoriesModel productGroup in listProductCategoriesOnDevice) {
    if(productGroup.title == categoryTitle) {
      for(String title in productGroup.items) {
        titles.add(title);
      }
    }
  }
  return titles;
}
