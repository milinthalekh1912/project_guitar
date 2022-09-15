import 'package:flutter/material.dart';
import 'package:form/form/component/dialog.dart';
import 'package:form/manager/get_brand_manager.dart';

Future<String> addBrandDialog(BuildContext context) async {

  bool isAddBrandSuccess = false;
  TextEditingController thController = TextEditingController();
  TextEditingController enController = TextEditingController();

  await showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        elevation: 16,
        actions: [
          SingleChildScrollView(
            child: Container(
              // height: 285,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: const [
                          Text('Brand(ภาษาไทย) :'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 200,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                controller: thController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        children: const [
                          Text('Brand(อังกฤษ) :'),
                        ],
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                controller: enController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          thController.text = '';
                          enController.text = '';
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
                      TextButton(
                        onPressed: () async {
                          //TODO: Validate brand name

                          String th = thController.text;
                          String en = enController.text;

                          if(th == '' || en == '') {
                            ErrorDialog errorDialog = ErrorDialog(context: context, title: 'กรุณาระบุข้อมูล');
                            await errorDialog.show();
                            return;
                          }
                          LoadingDialog loadingDialog = LoadingDialog(context: context, title: 'กำลังบันทึกข้อมูล...');
                          loadingDialog.show();
                          BrandManager manager = BrandManager();
                          dynamic result = await manager.postBrand(
                              thController.text, enController.text);
                          Navigator.pop(context);
                          if (result.runtimeType == String) {
                            isAddBrandSuccess = true;
                            Navigator.pop(context);
                          } else {
                            ErrorDialog errorDialog = ErrorDialog(context: context, title: 'เกิดข้อผิดพลาดในการบันทึกข้อมูล');
                            await errorDialog.show();
                            return;
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
                              )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
    },
  );

  if (isAddBrandSuccess) {
    return thController.text;
  }
  return '';
}
