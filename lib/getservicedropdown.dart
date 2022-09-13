import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form/service/config_object.dart';
import 'package:form/service/product_categories_service/product_categories_model.dart';
import 'package:form/service/product_group_service/get_product_groups_model.dart';
import 'package:form/service/product_size_service/product_size_model.dart';
import 'package:form/service/product_unit_service/product_unit_model.dart';

List<String> getDropdownItem() {
  List<String> titles = [];
  for (ProductUnitModel unit in listProductUnitOnDevice) {
    titles.add(unit.name);
    // print('${unit.name} - ${titles.where((String element) => unit.name.contains(element)).toList()}');
  }
  return titles.toSet().toList();
}

List<String> getProductDropdownItem() {
  List<String> sizeTitles = [];
  for (ProductSizeModel size in listProductSizeOnDevice) {
    sizeTitles.add(size.name);
  }
  return sizeTitles;
}

List<String> extractDepartmentTitle() {
  List<String> titles = [];

  for (ProductgroupsModel productGroup in listProductGroupsOnDevice) {
    titles.add(productGroup.th_prodcat);
  }
  return titles;
}

List<String> extractCategoriesTitle(String selectedDepartmentTitle) {
  List<String> categoriesTitle = [];
  List<String> categoriesId = [];
  for (ProductgroupsModel productGroup in listProductGroupsOnDevice) {
    if (productGroup.th_prodcat == selectedDepartmentTitle) {
      for (CategoriesID id in productGroup.categories) {
        categoriesId.add(id.id);
      }
    }
  }

  for(String id in categoriesId) {
    for (ProductCategoriesModel category in listProductCategoriesOnDevice) {
      if (category.id == id) {
        categoriesTitle.add(category.title);
      }
    }
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
  for (ProductCategoriesModel productGroup in listProductCategoriesOnDevice) {
    if (productGroup.title == categoryTitle) {
      // for (String title in productGroup.items) {
      //   titles.add(title);
      // }
      //Oat Edit
      for (SubcateInCateModel title in productGroup.subcates) {
        titles.add(title.title);
      }
    }
  }
  return titles;
}
