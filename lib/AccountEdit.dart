import 'dart:convert';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'SigninPage.dart';
import 'ConfirmPage.dart';
import 'SigninPage.dart';
import 'AccountSetting.dart';

void EditError(context, text, button_text) {
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

class AccountEdit extends StatefulWidget {
  @override
  _AccountEditState createState() => _AccountEditState();
}

class _AccountEditState extends State<AccountEdit> {
  var usernamecontroller = TextEditingController(text: globals.username);
  var passwordcontroller = TextEditingController(text: globals.password);
  var phonenumbercontroller = TextEditingController(text: globals.phonenumber);
  var eitaa_idcontroller = TextEditingController(text: globals.eitaa_id);
  var addresscontroller = TextEditingController(text: globals.address);
  var post_codecontroller = TextEditingController(text: globals.post_code);

  void edit_account(
      username, password, phonenumber, eitaa_id, address, post_code) async {
    if (usernamecontroller.text == "") {
      EditError(context, "لطفا نام کاربری را وارد کنید.", "باشه");
    } else if (passwordcontroller.text == "") {
      EditError(context, "لطفا رمز عبور را وارد کنید.", "باشه");
    } else if (phonenumbercontroller.text == "") {
      EditError(context, "لطفا شماره تلفن را وارد کنید.", "باشه");
    } else if (eitaa_idcontroller.text == "") {
      EditError(context, "لطفا آیدی ایتا را وارد کنید.", "باشه");
    } else {
      SharedPreferences sharedPreferences;
      sharedPreferences = await SharedPreferences.getInstance();
      var url = Uri.http(globals.django_url, globals.edit_account_url);
      print(url);
      Response response = await post(url, body: {
        'old_username': sharedPreferences.getString('username'),
        'new_username': username,
        'new_password': password,
        'new_phonenumber': phonenumber,
        "new_tel_id": eitaa_id,
        "new_address": address,
        "new_post_code": post_code
      });
      if (jsonDecode(response.body)['status'] == 'ok') {
        print(response.body);
        globals.username = username;
        globals.password = password;
        globals.phonenumber = phonenumber;
        globals.eitaa_id = eitaa_id;
        globals.address = address;
        globals.post_code = post_code;

        SharedPreferences sharedPreferences;
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("username", username);
        sharedPreferences.setString("password", password);
        sharedPreferences.setString("phonenumber", phonenumber);
        sharedPreferences.setString("eitaa_id", eitaa_id);
        sharedPreferences.setString("address", address);
        sharedPreferences.setString("post_code", post_code);
        sharedPreferences.commit();
      }
      if (jsonDecode(response.body)['status'] == 'error') {
        if (jsonDecode(response.body)['result'] == 'repetitious user') {
          // _showError(context);
          EditError(
              context, "این نام کاربری قبلا توسط کسی استفاده شده است.", "باشه");
        }
        if (jsonDecode(response.body)['result'] == 'repetitious phonenumber') {
          // _showError(context);
          EditError(
              context, "این شماره تلفن قبلا توسط کسی استفاده شده است.", "باشه");
        }
      } else {
        EditError(context, "حساب کاربری شما ویرایش شد.", "باشه");
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AccountSettingPage()));
      }
    }
  }

  void storage() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    // SharedPreferences sharedPreferences;
    // sharedPreferences = await SharedPreferences.getInstance();
    // var usernamecontroller = TextEditingController(text: "erdtfyguhijok");
    // var passwordcontroller = TextEditingController(text: sharedPreferences.getString('password'));
    // var phonenumbercontroller = TextEditingController(text: sharedPreferences.getString('phonenumber'));
    // var eitaa_idcontroller = TextEditingController(text: sharedPreferences.getString('eitaa_id'));
    // var addresscontroller = TextEditingController(text: sharedPreferences.getString('address'));
    // var post_codecontroller = TextEditingController(text: sharedPreferences.getString('post_code'));
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ویرایش حساب کاربری",
            style: TextStyle(color: Colors.black, fontFamily: 'Vazir'),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 2,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(children: [
          Container(
            child: Container(
              color: Colors.white,
              child: Container(
                child: Padding(
                    padding: EdgeInsets.all(45),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: " * نام کاربری",
                                  hintStyle: TextStyle(color: Colors.black38),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  icon: Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.person_outline,
                                      color: Colors.black38,
                                    ),
                                  )),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              controller: usernamecontroller,
                            ),
                            elevation: 20,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: " * رمز عبور",
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
                              controller: passwordcontroller,
                            ),
                            elevation: 20,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: " * تلفن همراه",
                                  hintStyle: TextStyle(color: Colors.black38),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  icon: Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.phone_outlined,
                                      color: Colors.black38,
                                    ),
                                  )),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              controller: phonenumbercontroller,
                            ),
                            elevation: 20,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          SizedBox(height: 20),
                          Material(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: " * آیدی ایتا",
                                  hintStyle: TextStyle(color: Colors.black38),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  icon: Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.alternate_email,
                                      color: Colors.black38,
                                    ),
                                  )),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              controller: eitaa_idcontroller,
                            ),
                            elevation: 20,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          SizedBox(height: 20),
                          Material(
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "آدرس منزل",
                                  hintStyle: TextStyle(color: Colors.black38),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  icon: Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.home_outlined,
                                      color: Colors.black38,
                                    ),
                                  )),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              controller: addresscontroller,
                            ),
                            elevation: 20,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          SizedBox(height: 20),
                          Material(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "کدپستی",
                                  hintStyle: TextStyle(color: Colors.black38),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  icon: Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.local_shipping_outlined,
                                      color: Colors.black38,
                                    ),
                                  )),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              controller: post_codecontroller,
                            ),
                            elevation: 20,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 40, right: 40),
                            child: Material(
                              elevation: 20,
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.green,
                              child: InkWell(
                                onTap: () {
                                  edit_account(
                                    usernamecontroller.text,
                                    passwordcontroller.text,
                                    phonenumbercontroller.text,
                                    eitaa_idcontroller.text,
                                    addresscontroller.text,
                                    post_codecontroller.text,
                                  );
                                },
                                child: Container(
                                  width: 500,
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    "ویرایش حساب کاربری",
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
          )
        ]));
  }
}
