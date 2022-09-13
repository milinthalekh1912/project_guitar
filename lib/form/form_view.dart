import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/service/get_sku_by_id_url/get_sku_by_id_model.dart';
import 'package:form/service/get_sku_lookup_by_barcode/get_sku_lookup_by_barcode_model.dart';
import '../appbar_form.dart';
import '../brand_dropdown.dart';
import '../dialogaddbrand.dart';
import '../getservicedropdown.dart';
import '../manager/get_sku_lookup_by_id_manager.dart';
import '../service/config_object.dart';
import '../service/product_categories_service/product_categories_model.dart';
import '../service/product_group_service/get_product_groups_model.dart';
import '../service/product_size_service/product_size_model.dart';
import '../service/product_unit_service/product_unit_model.dart';
import '../textlable.dart';

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

  final _barcodeTextField = TextEditingController();
  final _itemNameTextFieldController = TextEditingController();
  final _sizeTextFieldController = TextEditingController();
  final _priceTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var size, width;
    size = MediaQuery.of(context).size;
    width = size.width;

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            const Appbar(),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 800,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _barcode(width),
                  const SpaceHeight(),
                  _itemTitle(width),
                  const SpaceHeight(),
                  _department(width),
                  const SpaceHeight(),
                  _categories(width),
                  const SpaceHeight(),
                  _subcategories(width),
                  const SpaceHeight(),
                  _brands(),
                  const SpaceHeight(),
                  _size(width),
                  const SpaceHeight(),
                  _units(width),
                  const SpaceHeight(),
                  _price(width),
                  const SpaceHeight(),
                  _button(),
                  const SpaceHeight(),
                ],
              ),
            ),
          ],
        ),
      )),
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
              print('event Reset');
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
              )),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              print('event Submit');
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
              )),
            ),
          ),
        ],
      ),
    );
  }

  Row _price(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Textlable(title: 'ราคา'),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: width / 4,
              height: 50,
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
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: SizedBox(width: 100, child: Center(child: Text('บาท'))),
            ),
          ],
        ),
      ],
    );
  }

  Row _units(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Textlable(title: 'หน่วยขาย'),
        Container(
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
            child: DropdownButton<String>(
              hint: const Text('เลือก'),
              // isExpanded: true,
              value: selectedUnitTitle ,
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
      ],
    );
  }

  Row _size(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Textlable(title: 'ปริมาณ/ขนาด'),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: width / 4.8,
              height: 50,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: Colors.amber,
                    border: Border.all(
                      width: 1,
                    )),
                height: 50,
                width: 150,
                // height: 0,
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
      ],
    );
  }

  Row _brands() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Textlable(title: 'Brand'),
        Row(
          children: const [
            Brand(),
            addbuttonBrand(),
          ],
        ),
      ],
    );
  }

  Row _subcategories(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Textlable(title: 'Subcategories'),
        selectedCategoryTitle == null
            ? Container(
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
              )
            : Container(
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
      ],
    );
  }

  Row _categories(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Textlable(title: 'Categories'),
        selectedDepartment == null
            ? Container(
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
                  child: DropdownButton<String>(
                    hint: const Text('เลือก'),
                    isExpanded: true,
                    value: '',
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      //  print(value);
                      setState(() {
                        if (value != null) {
                          selectedCategoryTitle = value;
                        }
                      });
                    },
                    items: const [],
                  ),
                ),
              )
            : Container(
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
                    hint: const Text('เลือก'),
                    isExpanded: true,
                    value: selectedCategoryTitle,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      //  print(value);
                      setState(() {
                        if (value != null) {
                          selectedCategoryTitle = value;
                        }
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
      ],
    );
  }

  Row _department(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Textlable(title: 'Department'),
        Container(
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
              hint: const Text('เลือก'),
              isExpanded: true,
              value: selectedDepartment,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                setState(() {
                  selectedDepartment = value;
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
      ],
    );
  }

  Row _itemTitle(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Textlable(title: 'ชื่อสินค้า'),
        Container(
          padding: const EdgeInsets.all(8),
          width: width / 3,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: _itemNameTextFieldController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Row _barcode(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Textlable(title: 'Barcode'),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: width / 4.1,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print('Scan');
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.document_scanner_outlined),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onCategorySelected(String newTitle) {
    setState(() {
      selectedCategoryTitle = newTitle;
    });
  }

  Future<void> onScannedBarcode(String barcode) async {
    SkuLookUpByIdManager manager = SkuLookUpByIdManager();
    dynamic result = await manager.getSkuLookupById(barcode);

    if (result.runtimeType == GetSkuModel) {
      setState(() {
        GetSkuModel itemData = result as GetSkuModel;
        _itemNameTextFieldController.text = itemData.productName;

        if (itemData.packSize != null) {
          _sizeTextFieldController.text = itemData.packSize!;
        }

        _priceTextFieldController.text = itemData.price.toStringAsFixed(2);

        for (ProductgroupsModel productGroup in listProductGroupsOnDevice) {
          if (productGroup.prodcatID ==
              itemData.prodGroupID.toStringAsFixed(0)) {
            selectedDepartment = itemData.prodGroupID.toStringAsFixed(0);
            break;
          }
        }

        for (ProductCategoriesModel category in listProductCategoriesOnDevice) {
          if (category.id == itemData.prodCatID.toStringAsFixed(0)) {
            selectedCategoryTitle = itemData.prodCatID.toStringAsFixed(0);
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
