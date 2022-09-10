import 'package:flutter/material.dart';
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
                await LogoutManager().logoutRequest();
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Logo'),
          ),
        ],
      ),
    );
  }
}
