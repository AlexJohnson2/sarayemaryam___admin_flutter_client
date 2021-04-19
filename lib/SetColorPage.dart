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
import 'SetSizePage.dart';

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

class SetColorPage extends StatefulWidget {
  @override
  _SetColorPageState createState() => _SetColorPageState();
}

class _SetColorPageState extends State<SetColorPage> {
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
            "انتخاب رنگ",
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
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "مشکی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "مشکی",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "سفید";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "سفید",
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
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "قرمز";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "قرمز",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "زرد";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "زرد",
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
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "نارنجی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "نارنجی",
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
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "آبی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "آبی",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "سبز";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "سبز",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Colors.indigo[900],
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "سرمه ای";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "سرمه ای",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Color.fromRGBO(0, 255, 127, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "یشمی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "یشمی",
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
                                  color: Color.fromRGBO(255, 244, 248, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "یاسی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "یاسی",
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
                                  color: Color.fromRGBO(230, 230, 250, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "بنفش";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "بنفش",
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
                                  color: Color.fromRGBO(255, 192, 203, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "صورتی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "صورتی",
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
                                  color: Color.fromRGBO(192, 192, 192, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "طوسی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "طوسی",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Color.fromRGBO(250, 250, 210, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "لیمویی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "لیمویی",
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
                                  color: Color.fromRGBO(165, 42, 42, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "قهوه ای";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "قهوه ای",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                  color: Color.fromRGBO(216, 191, 216, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "بادمجانی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "بادمجانی",
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
                                  color: Color.fromRGBO(255, 228, 196, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "کرمی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "کرمی",
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
                                  color: Color.fromRGBO(255, 255, 224, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "شیری";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "شیری",
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
                                  color: Color.fromRGBO(240, 230, 131, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "خاکی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "خاکی",
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
                                  color: Color.fromRGBO(0, 255, 255, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "فیروزه ای";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "فیروزه ای",
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
                                  color: Color.fromRGBO(218, 165, 32, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "خردلی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "خردلی",
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
                                  color: Color.fromRGBO(220, 220, 220, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "خاکستری";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "خاکستری",
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
                                  color: Color.fromRGBO(154, 205, 5, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "لجنی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "لجنی",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "جگری";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "جگری",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "نقره ای";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "نقره ای",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "طلایی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "طلایی",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "چند رنگ";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "چند رنگ",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "رنگ مطابق با تصویر";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "رنگ مطابق با تصویر",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "بدون رنگ";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "بدون رنگ",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "زرشکی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "زرشکی",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "سبزآبی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "سبزآبی",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "گل بهی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "گل بهی",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "آبی نفتی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "آبی نفتی",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "کالباسی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "کالباسی",
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
                                  color: Color.fromRGBO(205, 92, 92, 1.0),
                                  borderRadius: BorderRadius.circular(50),
                                  child: InkWell(
                                    onTap: () {
                                      globals.color = "سرخ آبی";
                                      globals.new_color = {
                                        "color": globals.color,
                                        "size": []
                                      };
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SetSizePage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Text(
                                          "سرخ آبی",
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
