import 'package:flutter/material.dart';
import 'package:form/form.dart';

import 'package:form/login/login_view_model.dart';

import '../color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  @override
  late final LoginViewModel _viewModel =
  LoginViewModel(username.text.toString(), password.text.toString());
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // String username;
    return Scaffold(
      backgroundColor: kBackgroundDarkGrayColor,
      body: SingleChildScrollView(
        child: Form(
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: height / 1.5,
                      width: width / 1.5,
                      decoration: BoxDecoration(
                        color: kLightBackgroundOrangeColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("POS Login",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width / 3.5,
                              child: TextField(
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  hintText: 'ชื่อบัญชีผู้ใช้งาน',
                                ),
                                controller: username,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            width: width / 3.5,
                            child: TextField(
                              obscureText: true,
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                hintText: 'รหัสผ่าน',
                              ),
                              controller: password,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async{
                              setState(() {
                                _viewModel.model.username = username.text;
                                _viewModel.model.password = password.text;
                              });
                              if (_viewModel.model.username == "" ||
                                  _viewModel.model.password == "") {
                                _showMyDialog(context,'โปรดระบุ Username และ Password');
                              }else{
                                var result = await _viewModel.userOnClickLogin();
                                if(result == true){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FormCart()),
                                  );
                                }else{
                                  _showMyDialog(context,result);
                                }
                              }
                            },
                            child: Container(
                              height: height / 10,
                              width: width / 3.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: kPrimaryColor,
                              ),
                              child: const Center(
                                child: Text('เข้าสู่ระบบ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Future<void> _showMyDialog(context,String msg) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('POS Alert'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(msg),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('กลับ'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}