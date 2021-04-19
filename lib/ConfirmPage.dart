import 'dart:convert';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'SignupPage.dart';
import 'dart:math';
import 'main.dart';

void ConfirmError(context, text, button_text) {
  final snackBar = SnackBar(
    content: Text(text, textDirection: TextDirection.rtl),
    action: SnackBarAction(
      label: button_text,
      onPressed: () {
        // Some code to undo the change.
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 10.0, // Inner padding for SnackBar content.
    ),
    duration: const Duration(milliseconds: 3500),
    behavior: SnackBarBehavior.floating,
  );

  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  var confirmcontroller = TextEditingController();

  void confirm(code, right_code) {
    if (code == right_code) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Sarayemaryam()));
    } else {
      ConfirmError(context, "کد وارد شده اشتباه است.", "باشه");
    }
  }

  // void initState(){
  //   super.initState();
  //   Random random = new Random();
  //   int ConfirmNumber = random.nextInt(100);
  // }

  @override
  Widget build(BuildContext context) {
    int ConfirmNumber;
    Random random = new Random();
    ConfirmNumber = random.nextInt(999999);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "تایید حساب کاربری",
            style: TextStyle(color: Colors.black, fontFamily: 'Vazir'),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 2,
          leading: Icon(Icons.add),
        ),
        body: Container(
          child: Container(
            color: Colors.white,
            child: Container(
              child: Padding(
                  padding: EdgeInsets.all(45),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(ConfirmNumber.toString()),
                        SizedBox(height: 10),
                        Material(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "کد را وارد کنید",
                                hintStyle: TextStyle(color: Colors.black38),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 10, 10, 10),
                                icon: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: Colors.black38,
                                  ),
                                )),
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                            controller: confirmcontroller,
                          ),
                          elevation: 20,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 60, right: 60),
                          child: Material(
                            elevation: 20,
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green,
                            child: InkWell(
                              onTap: () {
                                confirm(int.parse(confirmcontroller.text),
                                    ConfirmNumber);
                              },
                              child: Container(
                                width: 500,
                                height: 50,
                                child: Center(
                                    child: Text(
                                  "ورود به حساب",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ])),
            ),
          ),
        ));
  }
}
