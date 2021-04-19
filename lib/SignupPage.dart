import 'dart:convert';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'SigninPage.dart';
import 'ConfirmPage.dart';

void SignupError(context, text, button_text) {
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

Future<void> _showError(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'هشدار',
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'نام کاربری و یا رمز عبور شما اشتباه است.',
                textDirection: TextDirection.rtl,
              ),
              Text(
                'لطفا دوباره تلاش کنید.',
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              child: Text('باشه'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}

const String kFileName = 'user.json';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var usernamecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var phonenumbercontroller = TextEditingController();
  var eitaa_idcontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var post_codecontroller = TextEditingController();

  void signup(
      username, password, phonenumber, eitaa_id, address, post_code) async {
    if (usernamecontroller.text == "") {
      SignupError(context, "لطفا نام کاربری را وارد کنید.", "باشه");
    } else if (passwordcontroller.text == "") {
      SignupError(context, "لطفا رمز عبور را وارد کنید.", "باشه");
    } else if (phonenumbercontroller.text == "") {
      SignupError(context, "لطفا شماره تلفن را وارد کنید.", "باشه");
    } else if (eitaa_idcontroller.text == "") {
      SignupError(context, "لطفا آیدی ایتا را وارد کنید.", "باشه");
    } else {
      var url = Uri.http(globals.django_url, globals.signup_url);
      print(url);
      Response response = await post(url, body: {
        'username': username,
        'password': password,
        'phonenumber': phonenumber,
        "tel_id": eitaa_id,
        "address": address,
        "post_code": post_code
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
          SignupError(
              context, "این نام کاربری قبلا توسط کسی استفاده شده است.", "باشه");
        }
        if (jsonDecode(response.body)['result'] == 'repetitious phonenumber') {
          // _showError(context);
          SignupError(
              context, "این شماره تلفن قبلا توسط کسی استفاده شده است.", "باشه");
        }
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ConfirmPage()));
      }
    }
  }

  void State() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString("username");
    globals.username = username;
    print(username);
    if (username.toString() != "null") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Sarayemaryam()));
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(Platform.localHostname);
    State();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ثبت نام",
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
                          Text("مقدار های دارای * اجباری هستند.",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              )),
                          SizedBox(height: 10),
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
                            padding: EdgeInsets.only(left: 60, right: 60),
                            child: Material(
                              elevation: 20,
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.green,
                              child: InkWell(
                                onTap: () {
                                  signup(
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
                                    "ثبت نام",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text("حساب کاربری دارید؟",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 60, right: 60),
                            child: Material(
                              elevation: 20,
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.blue[500],
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 500,
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    "وارد شوید",
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

/*



*/
