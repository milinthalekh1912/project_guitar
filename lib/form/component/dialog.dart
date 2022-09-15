import 'package:flutter/material.dart';

import 'package:form/form/component/solid_button.dart';
import 'package:form/form/constans/color.dart';
import 'package:form/form/constans/text_style.dart';

class LoadingDialog {
  BuildContext context;
  String? title;
  String? description;

  LoadingDialog({required this.context, this.title, this.description});

  void show() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.white,
          child: SizedBox(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title!,
                          style: kOrangeHeaderTextStyle,
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                  description != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            description!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 15,
                  ),
                  const CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ErrorDialog {
  BuildContext context;
  String title;
  String? description;

  ErrorDialog({required this.context, required this.title, this.description});

  Future<void> show() async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.white,
          child: SizedBox(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: kOrangeHeaderTextStyle,
                      ),
                    ),
                  ),
                  description != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            description!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: SolidButton(
                      title: 'ยืนยัน',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SuccessDialog {
  BuildContext context;
  String title;
  String? description;

  SuccessDialog({required this.context, required this.title, this.description});

  Future<void> show() async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.white,
          child: SizedBox(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: kOrangeHeaderTextStyle,
                      ),
                    ),
                  ),
                  description != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            description!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: SolidButton(
                      title: 'ตกลง',
                      bgColor: kButtonGreenColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
