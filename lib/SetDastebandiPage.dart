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
  hejab_saghedast_dastkesh,
  haraji,
  zivar_alat,
  pishnahad_vizhe,
  sefaresh_mardane,
  sefaresh_zanane,
  sefaresh_pesarane,
  sefaresh_dokhtarane,
  sefaresh_nozadi,
  sefaresh_sayer
}

SendKalaValues _Ersal = SendKalaValues.pooshak_mardane;

class SetDastebandiPage extends StatefulWidget {
  @override
  _SetDastebandiPageState createState() => _SetDastebandiPageState();
}

class _SetDastebandiPageState extends State<SetDastebandiPage> {
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
            "ادامه خرید",
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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Sarayemaryam()));
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
                            "لطفا دسته بندی کالا را انتخاب کنید.",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListBody(
                            children: [
                              Material(
                                color: Colors.yellow[200],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "پوشاک مردانه",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    value: SendKalaValues.pooshak_mardane,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.cyan[100],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "پوشاک زنانه",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    value: SendKalaValues.pooshak_zanane,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.red[100],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "پوشاک پسرانه",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    value: SendKalaValues.pooshak_pesarane,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "پوشاک دخترانه",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.pooshak_dokhtarane,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "پوشاک نوزادی",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.pooshak_nozadi,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.yellow[200],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "پارچه",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.parcheh,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.cyan[100],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "خرازی ابزار خیاطی",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.kharazi_abzarkhayati,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.red[100],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "خرازی لوازم التحریر",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.kharazi_lavazemtahrir,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "حجاب چادر",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.hejab_chador,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.yellow[200],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "حجاب شال",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.hejab_shal,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.cyan[100],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "حجاب روسری",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.hejab_roosari,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.red[100],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "حجاب ساق دست دستکش",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value:
                                        SendKalaValues.hejab_saghedast_dastkesh,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "حجاب ماسک پوشیه",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.hejab_mask_pooshie,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(50),
                                child: RadioListTile<SendKalaValues>(
                                    title: Text(
                                      "حراجی",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    value: SendKalaValues.haraji,
                                    groupValue: _Ersal,
                                    onChanged: (SendKalaValues value) {
                                      setState(() {
                                        _Ersal = value;
                                        globals.add_dastebandi_btn_text =
                                            _Ersal.toString().substring(
                                                15, _Ersal.toString().length);
                                        globals.add_dastebandi =
                                            _Ersal.toString();
                                      });
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                            child: RadioListTile<SendKalaValues>(
                                title: Text(
                                  "زیورآلات",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                value: SendKalaValues.zivar_alat,
                                groupValue: _Ersal,
                                onChanged: (SendKalaValues value) {
                                  setState(() {
                                    _Ersal = value;
                                    globals.add_dastebandi_btn_text =
                                        _Ersal.toString().substring(
                                            15, _Ersal.toString().length);
                                    globals.add_dastebandi = _Ersal.toString();
                                  });
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                            child: RadioListTile<SendKalaValues>(
                                title: Text(
                                  "پیشنهاد ویژه",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                value: SendKalaValues.pishnahad_vizhe,
                                groupValue: _Ersal,
                                onChanged: (SendKalaValues value) {
                                  setState(() {
                                    _Ersal = value;
                                    globals.add_dastebandi_btn_text =
                                        _Ersal.toString().substring(
                                            15, _Ersal.toString().length);
                                    globals.add_dastebandi = _Ersal.toString();
                                  });
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            color: Colors.yellow[200],
                            borderRadius: BorderRadius.circular(50),
                            child: RadioListTile<SendKalaValues>(
                                title: Text(
                                  "سفارش دوخت پوشاک مردانه",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                                value: SendKalaValues.sefaresh_mardane,
                                groupValue: _Ersal,
                                onChanged: (SendKalaValues value) {
                                  setState(() {
                                    _Ersal = value;
                                    globals.add_dastebandi_btn_text =
                                        _Ersal.toString().substring(
                                            15, _Ersal.toString().length);
                                    globals.add_dastebandi = _Ersal.toString();
                                  });
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            color: Colors.cyan[100],
                            borderRadius: BorderRadius.circular(50),
                            child: RadioListTile<SendKalaValues>(
                                title: Text(
                                  "سفارش دوخت پوشاک زنانه",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                                value: SendKalaValues.sefaresh_zanane,
                                groupValue: _Ersal,
                                onChanged: (SendKalaValues value) {
                                  setState(() {
                                    _Ersal = value;
                                    globals.add_dastebandi_btn_text =
                                        _Ersal.toString().substring(
                                            15, _Ersal.toString().length);
                                    globals.add_dastebandi = _Ersal.toString();
                                  });
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(50),
                            child: RadioListTile<SendKalaValues>(
                                title: Text(
                                  "سفارش دوخت پوشاک پسرانه",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                                value: SendKalaValues.sefaresh_pesarane,
                                groupValue: _Ersal,
                                onChanged: (SendKalaValues value) {
                                  setState(() {
                                    _Ersal = value;
                                    globals.add_dastebandi_btn_text =
                                        _Ersal.toString().substring(
                                            15, _Ersal.toString().length);
                                    globals.add_dastebandi = _Ersal.toString();
                                  });
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(50),
                            child: RadioListTile<SendKalaValues>(
                                title: Text(
                                  "سفارش دوخت پوشاک دخترانه",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                value: SendKalaValues.sefaresh_dokhtarane,
                                groupValue: _Ersal,
                                onChanged: (SendKalaValues value) {
                                  setState(() {
                                    _Ersal = value;
                                    globals.add_dastebandi_btn_text =
                                        _Ersal.toString().substring(
                                            15, _Ersal.toString().length);
                                    globals.add_dastebandi = _Ersal.toString();
                                  });
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                            child: RadioListTile<SendKalaValues>(
                                title: Text(
                                  "سفارش دوخت پوشاک نوزادی",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                value: SendKalaValues.sefaresh_nozadi,
                                groupValue: _Ersal,
                                onChanged: (SendKalaValues value) {
                                  setState(() {
                                    _Ersal = value;
                                    globals.add_dastebandi_btn_text =
                                        _Ersal.toString().substring(
                                            15, _Ersal.toString().length);
                                    globals.add_dastebandi = _Ersal.toString();
                                  });
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                            child: RadioListTile<SendKalaValues>(
                                title: Text(
                                  "سفارش دوخت سایر موارد",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                value: SendKalaValues.sefaresh_sayer,
                                groupValue: _Ersal,
                                onChanged: (SendKalaValues value) {
                                  setState(() {
                                    _Ersal = value;
                                    globals.add_dastebandi_btn_text =
                                        _Ersal.toString().substring(
                                            15, _Ersal.toString().length);
                                    globals.add_dastebandi = _Ersal.toString();
                                  });
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 60, right: 60),
                            child: Material(
                              elevation: 20,
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.green,
                              child: InkWell(
                                onTap: () {
                                  // globals.add_dastebandi = _Ersal.toString();
                                  print(_Ersal);
                                  print(globals.add_dastebandi);
                                  Navigator.of(context).pop();

                                  // Navigator.popAndPushNamed(context, '/');
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
