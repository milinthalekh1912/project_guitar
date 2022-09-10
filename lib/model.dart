import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class modalAddBrand extends StatelessWidget {
  const modalAddBrand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showBarModalBottomSheet(
              isDismissible: true,
              enableDrag: true,
              context: context,
              builder: ((context) => Container(
                    height: 500,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            CloseButton(),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                addBrand(
                                  lable: 'Brand (ภาษาไทย)',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                addBrand(
                                  lable: 'Brand(ภาษาอังกฤษ)',
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
                  )
                  ));
        },
        child: const Text('เพิ่ม'));
  }
}



class addBrand extends StatelessWidget {
  final String lable;
  const addBrand({
    Key? key,
    required this.lable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      child: Row(
        children: [
          Text(
            lable,
            style: const TextStyle(fontSize: 20),
          ),

          const SizedBox(
            width: 20,
          ),
          Container(
              padding: const EdgeInsets.all(8),
              width: width / 3,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  width: 1,
                ),
              ),
              child: const Expanded(child: TextField(
                 decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )))
        ],
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          alignment: Alignment.center,
          height: 30,
          width: 30,
          // padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            color: const Color.fromARGB(255, 210, 210, 210),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.close),
        ),
      ),
    );
  }
}
