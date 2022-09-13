import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/form/form_view_model.dart';
import 'package:form/service/config_object.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../appbar_form.dart';
import '../brand_dropdown.dart';
import '../depratment_dropdown.dart';
import '../dialogaddbrand.dart';
import '../getservicedropdown.dart';
import '../model.dart';
import '../salevalue_dropdown.dart';
import '../size_dropdown.dart';
import '../textlable.dart';

class FormCart extends StatefulWidget {
  final fieldText = TextEditingController();

  FormCart({super.key});
  void clearText() {
    fieldText.clear();
  }

  @override
  State<FormCart> createState() => _FormCartState();
}

class _FormCartState extends State<FormCart> {
  String? selectedCategoryTitle;
  String? selectedSubcategoryTitle;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var size, width;
    size = MediaQuery.of(context).size;
    width = size.width;
    //  List x =  listProductcategoriesOnDevice[2].items;
    // print(x);
    // for (var i = 0; i < x.length; i++) {
    //      print(i);
    //   // print( listProductSubCategoriesModel[1].title);
    // }

    for (var element in listProductCategoriesOnDevice) {
      // print(element.items);
      // if (element.title =='เบียร์') {
      //   print(element.id);
      // }

      // }

    }

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
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
                  Row(
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
                                child:
                                    const Icon(Icons.document_scanner_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SpaceHeight(),
                  Row(
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
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Textlable(title: 'Department'),
                      Depratment(),
                    ],
                  ),
                  const SpaceHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Textlable(title: 'Catagorie'),
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
                            items: extractCategoriesTitle().map((String title) {
                              return DropdownMenuItem(
                                value: title,
                                child: Text(title),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SpaceHeight(),
                  Row(
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
                  ),
                  const SpaceHeight(),
                  Row(
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
                  ),
                  const SpaceHeight(),
                  Row(
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
                            child: const TextField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizeValue(),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SpaceHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Textlable(title: 'หน่วยขาย'),
                      SaleValue(),
                    ],
                  ),
                  const SpaceHeight(),
                  Row(
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
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.,]')),
                              ],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                width: 100,
                                child: const Center(child: Text('บาท'))),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SpaceHeight(),
                  Padding(
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
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
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
                  ),
                  const SpaceHeight(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void onCategorySelected(String newTitle) {
    setState(() {
      selectedCategoryTitle = newTitle;
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
