import 'package:flutter/material.dart';
import 'model.dart';

class addbuttonBrand extends StatelessWidget {
  const addbuttonBrand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() {
        addBrandDialog(context); //Dialog
      }),
      child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
              )),
          child: const Center(
            child: Text(
              'เพิ่ม',
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}

Future<dynamic> addBrandDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            elevation: 16,
            // title: const Text('เพิ่ม brand'),
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
                              icon: const Icon(Icons.close))
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
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    width: 1,
                                  )),
                                  child: const Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ))),
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
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    width: 1,
                                  )),
                                  child: const Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ))),
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
                    ],
                  ),
                ),
              )
            ],
          ));
}
