import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'globals.dart' as globals;
import 'SigninPage.dart';
import 'package:http/http.dart';
import 'AccountEdit.dart';

class AccountSettingPage extends StatefulWidget {
  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  void delete_account() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.http(globals.django_url, globals.delete_account_url);
    Response response = await post(url, body: {
      "username": sharedPreferences.getString("username"),
      "password": sharedPreferences.getString("password")
    });
    print(response.body);

    setState(() {
      sharedPreferences.remove("username");
      sharedPreferences.remove("password");

      globals.username = '';
      globals.phonenumber = '';
      globals.eitaa_id = '';
      globals.address = '';
      globals.post_code = '';

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => SigninPage()),
        ModalRoute.withName('/'),
      );
    });
  }

  Future<void> Sure_to_delete_account(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'حذف حساب کاربری',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'آیا از حذف کردن حساب کاربری خود اطمینان دارید؟',
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: Text('بله'),
                  onPressed: () {
                    delete_account();
                  },
                ),
                TextButton(
                  child: Text('خیر'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void logout() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      sharedPreferences.remove("username");

      globals.username = '';
      globals.phonenumber = '';
      globals.eitaa_id = '';
      globals.address = '';
      globals.post_code = '';

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => SigninPage()),
        ModalRoute.withName('/'),
      );
    });
  }

  var username = "";
  var phonenumber = "";
  var eitaa_id = "";
  var address = "";
  var post_code = "";
  void storage() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      username = sharedPreferences.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    storage();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "تنظیمات حساب کاربری",
            style: TextStyle(color: Colors.black, fontFamily: 'Vazir'),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black87,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 2,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                  color: Colors.white,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            15))), //elevation: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    elevation: 15,
                    child: Container(
                        height: 560,
                        child: Column(children: [
                          Text(
                            "پروفایل حساب کاربری",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 40,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "نام کاربری: " + username,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Material(
                              elevation: 20,
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red[700],
                              child: InkWell(
                                onTap: () {
                                  logout();
                                },
                                child: Container(
                                  width: 500,
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    "خروج از حساب کاربری",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: Text(
                                "با حذف حساب کاربری دیگر نمی توانید وارد اپلیکیشن شوید و باید دوباره ثبت نام کنید.",
                                style: TextStyle(color: Colors.red[900]),
                                textDirection: TextDirection.rtl),
                          )
                        ])),
                  )),
            )
          ],
        ));
  }
}
