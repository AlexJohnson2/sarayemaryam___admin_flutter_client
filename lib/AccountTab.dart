import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'BottomTabBarAccount.dart';
import 'globals.dart' as globals;
import 'SigninPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AccountSetting.dart';

class AccountTab extends StatefulWidget {
  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  void logout() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      sharedPreferences.remove("username");
      sharedPreferences.remove("phonenumber");
      sharedPreferences.remove("eitaa_id");
      sharedPreferences.remove("address");
      sharedPreferences.remove("post_code");

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
    // SharedPreferences sharedPreferences;
    // sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      // username = sharedPreferences.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    // storage();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "سرای مریم",
          style: TextStyle(color: Colors.black, fontFamily: 'Vazir'),
        ),
        centerTitle: true,
        leading: Icon(Icons.add),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  15))), //elevation: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: 15,
          child: Container(
            height: 420,
            width: MediaQuery.of(context).size.width - 30,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // IconButton(
                        //   icon: Icon(Icons.settings_outlined,
                        //       color: Colors.black),
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (BuildContext context) =>
                        //                 AccountSettingPage()));
                        //   },
                        // ),
                        Text(
                          "پروفایل حساب کاربری",
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(Icons.logout, color: Colors.white),
                      ]),
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
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Material(
                    elevation: 20,
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.red[500],
                    child: InkWell(
                      onTap: () {
                        exit(0);
                      },
                      child: Container(
                        width: 500,
                        height: 50,
                        child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Text(
                                "بستن برنامه",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Icon(Icons.power_settings_new,
                                  color: Colors.white),
                            ])),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppBottomTabBarAccount(),
    );
  }
}
