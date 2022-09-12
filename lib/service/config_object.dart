import 'dart:convert';
import 'dart:io';
import 'package:form/service/brand_service/brand_model.dart';
import 'package:form/service/authorization_service/authorization_model.dart';
import 'package:form/service/login_service/login_api_model.dart';
import 'package:form/service/pos_config_service/pos_config_model.dart';
import 'package:form/service/product_categories_service/product_categories_model.dart';
import 'package:form/service/product_size_service/product_size_model.dart';
import 'package:form/service/product_subcategories_service/product_sub_categories_model.dart';
import 'package:form/service/product_unit_service/product_unit_model.dart';

import 'product_group_service/get_product_groups_model.dart';

const String pathJsonFile =
    '/storage/emulated/0/Android/data/com.tcctechnology.pos.pos/files/Pos_V1';
//Object of Security API
late AuthorizationModel authorizationModelOnDevice;
late PosConfigModelResponse200Model posConfigModelOnPos;
late LoginResponse200Model userOnPos;

//Object of Sale API
late List<BrandModel> listBrandOnDevice; //รายการ Brand
late List<ProductgroupsModel> listProductgroupsOnDevice; //รายการ Department
late List<ProductCategoriesModel> listProductcategoriesOnDevice;
late List<ProductSubCategoriesModel> listProductSubCategoriesModel;
late List<ProductSizeModel> listProductSizeOnDevice; //รายการ ปริมาณ ขนาด
late List<ProductUnitModel> listProductUnitOnDevice;  //รายการ ชิ้นแพ็คลัง

late String version;
