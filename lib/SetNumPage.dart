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
import 'FinishedByePage__2.dart';

void Error(context, text, button_text) {
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

enum SendKalaValues {
  pooshak_mardane,
  pooshak_zanane,
  pooshak_pesarane,
  pooshak_dokhtarane,
  pooshak_nozadi,
  parcheh,
  kharazi_abzarkhayati,
  kharazi_lavazemtahrir,
  hejab_chador,
  hejab_shal,
  hejab_roosari,
  hejab_mask_pooshie,
  hejab_saghedast_dastkesh
}

SendKalaValues _Ersal = SendKalaValues.pooshak_mardane;

class SetNumPage extends StatefulWidget {
  @override
  _SetNumPageState createState() => _SetNumPageState();
}

class _SetNumPageState extends State<SetNumPage> {
  void finished_bye() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString("address") == "") {
      Error(context, "لطفا آدرس خود را در بخش تنظیمات حساب کاربری کامل کنید.",
          "باشه");
    }
    if (sharedPreferences.getString("post_code") == "") {
      Error(context,
          "لطفا کد پستی خود را در بخش تنظیمات حساب کاربری کامل کنید.", "باشه");
    }
  }

  var mojoodicontroller = TextEditingController();

  var mojood_placeholder = "موجودی محصول";
  var mojood_icon_color = Colors.black38;

  bool namojood = false;

  void storage() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "تعیین موجودی",
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
                          Text(
                            "لطفا موجودی کالا را تعیین کنید.",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListBody(
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ناموجود؟",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Switch(
                                        activeColor: Colors.red,
                                        value: namojood,
                                        onChanged: (value) {
                                          setState(() {
                                            namojood = value;
                                            if (value) {
                                              mojood_placeholder = "";
                                              mojood_icon_color = Colors.white;
                                            } else {
                                              mojood_placeholder =
                                                  "موجودی محصول";
                                              mojood_icon_color =
                                                  Colors.black38;
                                            }
                                          });
                                        }),
                                  ),
                                ],
                              ),
                              Material(
                                child: TextField(
                                  enabled: !namojood,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: mojood_placeholder,
                                      hintStyle:
                                          TextStyle(color: Colors.black38),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(
                                          Icons.format_list_numbered_rounded,
                                          color: mojood_icon_color,
                                        ),
                                      )),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                  controller: mojoodicontroller,
                                ),
                                elevation: 20,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ],
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
                                  if (namojood) {
                                    globals.num = 0;
                                  } else {
                                    globals.num =
                                        int.parse(mojoodicontroller.text);
                                  }
                                  print(globals.color);
                                  print(globals.size);
                                  print(globals.num);

                                  globals.new_size = {
                                    "size": globals.size,
                                    "num": globals.num.toString()
                                  };

                                  globals.new_color["size"]
                                      .add(globals.new_size);

                                  globals.num = 0;

                                  print(globals.new_color);

                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 500,
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    "انتخاب",
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
