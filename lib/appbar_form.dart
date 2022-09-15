import 'package:flutter/material.dart';
import 'package:form/form/component/dialog.dart';
import 'package:form/manager/logout_manager.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: const Color.fromARGB(255, 225, 127, 67),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async{
                LoadingDialog loadingDialog = LoadingDialog(context: context, title: 'กำลังออกจากระบบ');
                loadingDialog.show();
                await LogoutManager().logoutRequest();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'ออกจากระบบ',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
