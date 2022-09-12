import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/service/config_object.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'appbar_form.dart';
import 'brand_dropdown.dart';
import 'depratment_dropdown.dart';
import 'dialogaddbrand.dart';
import 'dropdown_catagorie.dart';
import 'model.dart';
import 'salevalue_dropdown.dart';
import 'size_dropdown.dart';
import 'sub_catagorie.dart';
import 'textlable.dart';

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
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var size, width;
    size = MediaQuery.of(context).size;
    width = size.width;
    // ignore: avoid_print
    // print(listProductgroupsOnDevice.length);
    // for (var element in listBrandOnDevice) {
    //   print(element.tH_Brand);
    // }
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
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: width / 3,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        )),
                      ),
                      Container(
                        child: Icon(Icons.document_scanner_outlined),
                      )
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
                        child: const Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        )),
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
                      const Catagorie(),
                    ],
                  ),
                  const SpaceHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Textlable(title: 'Sub-Catagorie'),
                      SubCatagorie(),
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
                            child: const Expanded(
                                child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            )),
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
                            child: Expanded(
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
                            )),
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
