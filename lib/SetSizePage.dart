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
import 'SetNumPage.dart';

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

class SetSizePage extends StatefulWidget {
  @override
  _SetSizePageState createState() => _SetSizePageState();
}

class _SetSizePageState extends State<SetSizePage> {
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
            "انتخاب سایز",
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
                            "لطفا رنگ کالا را انتخاب کنید.",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListBody(
                            children: [
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "نوزادی 0";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "نوزادی 0",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "فری سایز";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "فری سایز",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              // Material(
                              //     color: Colors.grey[300],
                              //     borderRadius: BorderRadius.circular(50),
                              //     child: InkWell(
                              //       onTap: () {
                              //         globals.size = "طول";

                              //         Navigator.of(context).push(
                              //             MaterialPageRoute(
                              //                 builder: (context) =>
                              //                     SetNumPage()));
                              //       },
                              //       child: Padding(
                              //         padding: const EdgeInsets.all(10.0),
                              //         child: Center(
                              //           child: Text(
                              //             "طول",
                              //             style: TextStyle(
                              //                 fontSize: 18,
                              //                 color: Colors.black),
                              //           ),
                              //         ),
                              //       ),
                              //     )),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Material(
                              //     color: Colors.grey[300],
                              //     borderRadius: BorderRadius.circular(50),
                              //     child: InkWell(
                              //       onTap: () {
                              //         globals.size = "عرض";

                              //         Navigator.of(context).push(
                              //             MaterialPageRoute(
                              //                 builder: (context) =>
                              //                     SetNumPage()));
                              //       },
                              //       child: Padding(
                              //         padding: const EdgeInsets.all(10.0),
                              //         child: Center(
                              //           child: Text(
                              //             "عرض",
                              //             style: TextStyle(
                              //                 fontSize: 18,
                              //                 color: Colors.black),
                              //           ),
                              //         ),
                              //       ),
                              //     )),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "تک سایز";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "تک سایز",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "بدون سایز";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "بدون سایز",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              // Material(
                              //     color: Colors.grey[300],
                              //     borderRadius: BorderRadius.circular(50),
                              //     child: InkWell(
                              //       onTap: () {
                              //         globals.size = "ارتفاع";

                              //         Navigator.of(context).push(
                              //             MaterialPageRoute(
                              //                 builder: (context) =>
                              //                     SetNumPage()));
                              //       },
                              //       child: Padding(
                              //         padding: const EdgeInsets.all(10.0),
                              //         child: Center(
                              //           child: Text(
                              //             "ارتفاع",
                              //             style: TextStyle(
                              //                 fontSize: 18,
                              //                 color: Colors.black),
                              //           ),
                              //         ),
                              //       ),
                              //     )),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "نوزادی 1";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "نوزادی 1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "نوزادی 2";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "نوزادی 2",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "نوزادی 3";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "نوزادی 3",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "نوزادی 4";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "نوزادی 4",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "کودک 40";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "کودک 40",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "کودک 45";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "کودک 45",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "کودک 50";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "کودک 50",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "کودک 55";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "کودک 55",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "کودک 60";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "کودک 60",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "کودک 65";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "کودک 65",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "x small";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "x small",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "small";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "small",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "medium";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "medium",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "larg";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "larg",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "x larg";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "x larg",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "xx larg";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "xx larg",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "xxx larg";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "xxx larg",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.size = "xxxx larg";

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetNumPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "xxxx larg",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
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
                                  globals.new_color_size["result"]
                                      .add(globals.new_color);
                                  globals.new_color = {};
                                  globals.new_size = {};
                                  print(globals.new_color_size);
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
