// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/color.dart';
import 'package:form/form/component/dialog.dart';
import 'package:form/manager/sku_post_manager.dart';
import 'package:form/service/brand_service/brand_model.dart';
import 'package:form/service/get_sku_by_id_url/get_sku_by_id_model.dart';
import 'package:form/service/get_sku_lookup_by_barcode/get_sku_lookup_by_barcode_model.dart';
import 'package:form/service/post_sku_service/post_sku_model.dart';
import '../appbar_form.dart';
import '../dialogaddbrand.dart';
import '../getservicedropdown.dart';
import '../manager/get_sku_lookup_by_id_manager.dart';
import '../service/config_object.dart';
import '../service/product_categories_service/product_categories_model.dart';
import '../service/product_group_service/get_product_groups_model.dart';
import '../service/product_size_service/product_size_model.dart';
import '../service/product_unit_service/product_unit_model.dart';
import '../textlable.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class FormCart extends StatefulWidget {
  FormCart({super.key});

  @override
  State<FormCart> createState() => _FormCartState();
}

class _FormCartState extends State<FormCart> {
  String? selectedDepartment;
  String? selectedCategoryTitle;
  String? selectedSubcategoryTitle;
  String? selectedSizeTitle;
  String? selectedUnitTitle;
  String? selectedBrandTitle;

  final _barcodeTextField = TextEditingController();
  final _itemNameTextFieldController = TextEditingController();
  final _sizeTextFieldController = TextEditingController();
  final _priceTextFieldController = TextEditingController();

  bool isVat = true;
  bool isInTongFahCampaign = true;

  String? skuId;

  String? errorMsg;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Appbar(),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: 800,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _barcode(),
                    const SpaceHeight(),
                    _itemTitle(),
                    const SpaceHeight(),
                    _department(),
                    const SpaceHeight(),
                    _categories(),
                    const SpaceHeight(),
                    _subcategories(),
                    const SpaceHeight(),
                    _brands(),
                    const SpaceHeight(),
                    _size(),
                    const SpaceHeight(),
                    _units(),
                    const SpaceHeight(),
                    _price(),
                    const SpaceHeight(),
                    _vat(),
                    _tongFah(),
                    const SpaceHeight(),
                    _button(),
                    const SpaceHeight(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _vat() {
    return Row(
      children: [
        const Expanded(
          flex: 3,
          child: Textlable(title: 'คำนวนภาษีมูลค่าเพิ่ม 7%'),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Switch(
                activeColor: kPrimaryColor,
                value: isVat,
                onChanged: (newValue) {
                  setState(() {
                    isVat = newValue;
                  });
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Row _tongFah() {
    return Row(
      children: [
        const Expanded(
          flex: 3,
          child: Textlable(title: 'เข้าร่วมโครงการธงฟ้าประชารัฐ'),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Switch(
                activeColor: kPrimaryColor,
                value: isInTongFahCampaign,
                onChanged: (newValue) {
                  setState(() {
                    isInTongFahCampaign = newValue;
                  });
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Padding _button() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              reset();
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'Reset',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () async {
              SKUPostManager manager = SKUPostManager();
              PostSkuModel skuModel = PostSkuModel(
                skuid: skuId ?? '',
                barcodePos: _barcodeTextField.text ?? '',
                productName: _itemNameTextFieldController.text ?? '',
                brandID: null,
                productGroupID: null,
                productCatID: null,
                productSubCatID: null,
                productSizeID: null,
                productUnit: null,
                packSize: _sizeTextFieldController.text ?? '',
                unit: 0,
                banForPracharat: isInTongFahCampaign ? 1 : 0,
                isVat: isVat,
                createBy: userOnPos.username,
                createDate: DateTime.now().toString(),
                isActive: true,
                merchantID: null,
                mapSKU: null,
              );

              TitleSkuModel titleModel = TitleSkuModel(
                departmentTitle: selectedDepartment ?? '',
                categoryTitle: selectedCategoryTitle ?? '',
                subcategoryTitle: selectedSubcategoryTitle ?? '',
                brandTitle: selectedBrandTitle ?? '',
                sizeTitle: selectedSizeTitle ?? '',
                unitTitle: selectedUnitTitle ?? '',
              );
              bool update;
              if (skuId == null) {
                update = false;
              } else {
                update = true;
              }

              errorMsg = _validate(skuModel, titleModel);
              if (errorMsg != null) {
                ErrorDialog errorDialog = ErrorDialog(
                  context: context,
                  title: 'ข้อมูลไม่ถูกต้อง',
                  description: errorMsg,
                );

                await errorDialog.show();
                return;
              }

              LoadingDialog loadingDialog = LoadingDialog(
                  context: context, title: 'กำลังดำเนินการ กรุณารอสักครู่');
              loadingDialog.show();

              String? result = await manager.createSkuDetails(
                skuModel,
                titleModel,
                _barcodeTextField.text,
                update,
              );
              Navigator.pop(context);

              if (result == null) {
                SuccessDialog(context: context, title: 'บันทึกสำเร็จ').show();
                setState(() {
                  reset();
                });
              } else {
                ErrorDialog(
                        context: context,
                        title: 'เกิดข้อผิดพลาด',
                        description: 'บาร์โค้ดนี้มีอยู่ในระบบแล้ว')
                    .show();
              }
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  border: Border.all(
                    width: 1,
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'บันทึก',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _validate(PostSkuModel skuModel, TitleSkuModel titleModel) {
    if (skuModel.barcodePos == null ||
        skuModel.barcodePos == '' ||
        skuModel.barcodePos.length > 15) {
      return 'บาร์โค้ดไม่ถูกต้อง';
    }
    if (skuModel.productName == null || skuModel.productName == '') {
      return 'ชื่อสินค้าไม่ถูกต้อง';
    }

    if (titleModel.departmentTitle == null ||
        titleModel.departmentTitle == '') {
      return 'ข้อมูล Department ไม่ถูกต้อง';
    }
    if (titleModel.categoryTitle == null || titleModel.categoryTitle == '') {
      return 'ข้อมูล Category ไม่ถูกต้อง';
    }

    if (titleModel.subcategoryTitle == null ||
        titleModel.subcategoryTitle == '') {
      return 'ข้อมูล Subcategory ไม่ถูกต้อง';
    }

    if (titleModel.brandTitle == null || titleModel.brandTitle == '') {
      return 'กรุณาเลือกแบนด์';
    }
    if (titleModel.sizeTitle == null || titleModel.sizeTitle == '') {
      return 'ข้อมูลปริมาณ/ขนาดไม่ถูกต้อง';
    }
    if (skuModel.packSize == null || skuModel.packSize == '') {
      return 'แพ๊คขนาดไม่ถูกต้อง';
    }

    if (titleModel.unitTitle == null || titleModel.unitTitle == '') {
      return 'ข้อมูลหน่วยขายไม่ถูกต้อง';
    }

    if (skuModel.isVat == null) {
      return 'vat ไม่ถูกต้อง';
    }

    if (skuModel.banForPracharat == null) {
      return 'แพ๊คขนาดไม่ถูกต้อง';
    }

    if (skuModel.createBy == null || skuModel.createBy == '') {
      return 'ข้อมูลลูกค้าไม่ถูกต้อง';
    }

    if (skuModel.createDate == null || skuModel.createDate == '') {
      return 'วันที่ไม่ถูกต้อง';
    }

    return null;
  }

  Row _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 3, child: Textlable(title: 'ราคา')),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _priceTextFieldController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: SizedBox(width: 100, child: Center(child: Text('บาท'))),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _units() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 3, child: Textlable(title: 'หน่วยขาย')),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // color: Colors.amber,
              border: Border.all(
                width: 1,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: const Text('เลือก'),
                // isExpanded: true,
                value: selectedUnitTitle,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                items: getDropdownItem().map((String title) {
                  return DropdownMenuItem(
                    value: title,
                    child: Text(title),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedUnitTitle = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _size() {
    return Row(
      children: [
        const Expanded(flex: 3, child: Textlable(title: 'ปริมาณ/ขนาด')),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _sizeTextFieldController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: Colors.amber,
                      border: Border.all(
                        width: 1,
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: const Text('เลือก'),
                      // isExpanded: true,
                      value: selectedSizeTitle,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          selectedSizeTitle = value;
                        });
                      },
                      items: getProductDropdownItem().map((String title) {
                        return DropdownMenuItem(
                          value: title,
                          child: Text(title),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Row _brands() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 3, child: Textlable(title: 'Brand')),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Colors.amber,
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Autocomplete(
                    fieldViewBuilder: (context, textEditingController,
                            focusNode, onFieldSubmitted) =>
                        TextFormField(
                      controller: textEditingController
                        ..text = selectedBrandTitle ?? '',
                      focusNode: focusNode,
                    ),
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return getBrandItem().where(
                        (value) {
                          return value
                              .contains(textEditingValue.text.toLowerCase());
                        },
                      );
                    },
                    onSelected: (selection) {
                      selectedBrandTitle = selection;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      )),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: (() async {
                      dynamic newBrandTitle = await addBrandDialog(context);
                      setState(() {
                        if (newBrandTitle != null &&
                            newBrandTitle.runtimeType == String) {
                          selectedBrandTitle = newBrandTitle;
                        }
                      });
                    }),
                    child: const Center(
                      child: Text(
                        'เพิ่ม',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _subcategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 3, child: Textlable(title: 'Subcategories')),
        if (selectedCategoryTitle == null)
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: Colors.amber,
                border: Border.all(
                  width: 1,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text('เลือก'),
                  // isExpanded: true,
                  value: '',
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedSubcategoryTitle = value;
                      });
                    }
                  },
                  items: const [],
                ),
              ),
            ),
          )
        else
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // color: Colors.amber,
                  border: Border.all(
                    width: 1,
                  )),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: const Text('เลือก'),
                  // isExpanded: true,
                  value: selectedSubcategoryTitle,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedSubcategoryTitle = value;
                      });
                    }
                  },
                  items: extractSubcategoriesTitle(selectedCategoryTitle!)
                      .map((String title) {
                    return DropdownMenuItem(
                      value: title,
                      child: Text(title),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Row _categories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 3, child: Textlable(title: 'Categories')),
        if (selectedDepartment == null)
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: Colors.amber,
                border: Border.all(
                  width: 1,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text('เลือก'),
                  isExpanded: true,
                  value: '',
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {},
                  items: const [],
                ),
              ),
            ),
          )
        else
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: Colors.amber,
                border: Border.all(
                  width: 1,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: const Text('เลือก'),
                  isExpanded: true,
                  value: selectedCategoryTitle,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    //  print(value);
                    setState(() {
                      selectedCategoryTitle = value;
                      selectedSubcategoryTitle = null;
                    });
                  },
                  items: extractCategoriesTitle(selectedDepartment!)
                      .map((String title) {
                    return DropdownMenuItem(
                      value: title,
                      child: Text(title),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Row _department() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 3, child: Textlable(title: 'Department')),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // color: Colors.amber,
              border: Border.all(
                width: 1,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: const Text('เลือก'),
                isExpanded: true,
                value: selectedDepartment,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value;
                    selectedCategoryTitle = null;
                    selectedSubcategoryTitle = null;
                  });
                },
                items: extractDepartmentTitle().map((String title) {
                  return DropdownMenuItem(
                    value: title,
                    child: Text(title),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _itemTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 3, child: Textlable(title: 'ชื่อสินค้า')),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _itemNameTextFieldController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _barcode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(flex: 3, child: Textlable(title: 'Barcode')),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _barcodeTextField,
                    onSubmitted: (barcode) async {
                      onUserInputBarcode(barcode);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () async {
                    String barcodeScanRes =
                        await FlutterBarcodeScanner.scanBarcode(
                            "#ff6666", "ยกเลิก", false, ScanMode.DEFAULT);
                    onUserInputBarcode(barcodeScanRes);
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.camera_alt_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onCategorySelected(String newTitle) {
    setState(() {
      selectedCategoryTitle = newTitle;
    });
  }

  Future<void> onUserInputBarcode(String barcode) async {
    SkuLookUpByIdManager manager = SkuLookUpByIdManager();

    dynamic result = await manager.getSkuLookupById(barcode);

    if (result.runtimeType == GetSkuModel) {
      setState(() {
        _barcodeTextField.text = barcode;

        GetSkuModel itemData = result as GetSkuModel;
        skuId = itemData.skuid;
        isVat = itemData.isVat;
        isInTongFahCampaign = itemData.banForPracharat == 1 ? true : false;

        _itemNameTextFieldController.text = itemData.productName;

        if (itemData.packSize != null) {
          _sizeTextFieldController.text = itemData.packSize!;
        }

        _priceTextFieldController.text = itemData.price.toStringAsFixed(2);

        for (BrandModel brandModel in listBrandOnDevice) {
          if (brandModel.brandID == itemData.brandID.toStringAsFixed(0)) {
            selectedBrandTitle = brandModel.tH_Brand;
          }
        }

        for (ProductgroupsModel productGroup in listProductGroupsOnDevice) {
          if (productGroup.prodcatID ==
              itemData.prodGroupID.toStringAsFixed(0)) {
            selectedDepartment = productGroup.th_prodcat;
            break;
          }
        }

        for (ProductCategoriesModel category in listProductCategoriesOnDevice) {
          if (category.id == itemData.prodCatID.toStringAsFixed(0)) {
            selectedCategoryTitle = category.title;
            if (itemData.productSubCatID != null) {
              for (SubcateInCateModel subcategory in category.subcates) {
                if (subcategory.id ==
                    itemData.productSubCatID!.toStringAsFixed(0)) {
                  selectedSubcategoryTitle = subcategory.title;
                  break;
                }
              }
            }
            break;
          }
        }

        for (ProductSizeModel size in listProductSizeOnDevice) {
          if (size.productSizeID == itemData.productSizeID) {
            selectedSizeTitle = size.name;
          }
        }

        for (ProductUnitModel unit in listProductUnitOnDevice) {
          if (unit.productUnitID == itemData.productUnit) {
            selectedUnitTitle = unit.name;
          }
        }
      });
    } else if (result.runtimeType == List<SkuLookupBarcodeModel>) {
    } else {}
  }

  void clearText() {
    _barcodeTextField.clear();
  }

  List<String> getBrandItem() {
    List<String> listBrandItem = [];
    for (var i = 0; i < listBrandOnDevice.length; i++) {
      String brandItem = listBrandOnDevice[i].tH_Brand;
      listBrandItem.add(brandItem);
    }
    // print(listBrandItem);
    return listBrandItem;
  }

  void reset() {
    setState(() {
      skuId = null;
      _barcodeTextField.text = '';
      _itemNameTextFieldController.text = '';
      _priceTextFieldController.text = '';
      _sizeTextFieldController.text = '';

      selectedBrandTitle = null;
      selectedSubcategoryTitle = null;
      selectedCategoryTitle = null;
      selectedDepartment = null;
      selectedSizeTitle = null;
      selectedUnitTitle = null;
    });
  }
}

class SpaceHeight extends StatelessWidget {
  const SpaceHeight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class space extends StatelessWidget {
  const space({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
    );
  }
}
