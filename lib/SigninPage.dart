import 'dart:convert';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'SignupPage.dart';

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

void SigninError(context, text, button_text) {
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

const String kFileName = 'user.json';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  var usernamecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  void signin(username, password) async {
    var url = Uri.http(globals.django_url, globals.signin_url);
    print(url);
    Response response =
        await post(url, body: {'username': username, 'password': password});
    if (jsonDecode(response.body)['status'] == 'ok') {
      print(response.body);
      globals.username = username;
      globals.password = password;

      SharedPreferences sharedPreferences;
      sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("username", username);
      sharedPreferences.setString("password", password);
      SharedPreferences.setMockInitialValues({'a': 'd'});
      print(SharedPreferences.getInstance());
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Sarayemaryam()));
    }
    if (jsonDecode(response.body)['status'] == 'error') {
      // _showError(context);
      SigninError(context, "رمزعبور و یا نام کاربری شما اشتباه است.", "باشه");
    }

    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => Sarayemaryam()));
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
            "ورود به حساب کاربری",
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
                        Material(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "نام کاربری",
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
                                hintText: "رمز عبور",
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
                        Padding(
                          padding: EdgeInsets.only(left: 60, right: 60),
                          child: Material(
                            elevation: 20,
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green,
                            child: InkWell(
                              onTap: () {
                                signin(usernamecontroller.text,
                                    passwordcontroller.text);
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
                        SizedBox(height: 10),
                        Text("حساب کاربری ندارید؟",
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                              },
                              child: Container(
                                width: 500,
                                height: 50,
                                child: Center(
                                    child: Text(
                                  "ثبت نام کنید",
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
