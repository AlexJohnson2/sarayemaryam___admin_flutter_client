import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'globals.dart' as globals;
import 'BottomTabBarLearn.dart';
// درخواست ثبت نام شما به مسئول ثبت نام ارسال می شود و برای ارائه توضیحات در اسرع وقت با شما تماس خواهند گرفت.<br> جهت دریافت شرایط ثبت نام و شرکت در کلاس ها کاربری ایتای خود را چک کنید
import 'package:flutter/material.dart';
import 'Product.dart';
import 'BottomTabBarShopBagTab.dart';
import 'globals.dart' as globals;
import 'ShopBagList.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'Page__Discription.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'FinishedByePage.dart';
import 'TarikhcheKharidList.dart';
import 'SignupClassList.dart';

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

class LearnTab extends StatefulWidget {
  @override
  _LearnTabState createState() => _LearnTabState();
}

class _LearnTabState extends State<LearnTab> {
  void finished_bye() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("address") == "") {
      Error(context, "لطفا آدرس خود را در بخش تنظیمات حساب کاربری کامل کنید.",
          "باشه");
    } else if (sharedPreferences.getString("post_code") == "") {
      Error(context,
          "لطفا کد پستی خود را در بخش تنظیمات حساب کاربری کامل کنید.", "باشه");
    } else {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => FinishedByePage()));
    }
  }

  void edit_num(name, num) async {
    var url = Uri.http(globals.django_url, globals.edit_cart_url);
    Response response = await post(url, body: {
      "user": globals.username.toString(),
      "name": name.toString(),
      "num": num.toString()
    });
    print(response.body);
  }

  void delete_from_cart(name, amount, img) async {
    var url = Uri.http(globals.django_url, globals.delete_from_cart_url);
    Response response = await post(url, body: {
      "user": globals.username,
      "name": name,
      "amount": amount,
      "img": img,
    });
    getItems();
  }

  Future<void> Sure_to_delete_cart_item(context, name, amount, img) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'حذف از سبد خرید',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'آیا از حذف کردن این مورد اطمینان دارید؟',
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
                    delete_from_cart(name, amount, img);
                    Navigator.of(context).pop();
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

  void refresh() {
    setState(() {
      getItems();
    });
  }

  List<SignupClassList> _items = [];

  void getItems() async {
    var url = Uri.http(globals.django_url, globals.get_all_cart_url);
    print(url);
    Response response = await post(url, body: {"user": globals.username});
    setState(() {
      _items = [];
      var itemsjson = json.decode(response.body)['result'];
      // print(itemsjson);
      globals.all_amount = 0;
      for (var i in itemsjson) {
        // print(i['old_num']);
        var item = SignupClassList(
          i["username"],
          i["phonenumber"],
          i["tel_id"],
          i["address"],
          i["group"],
        );
        // print(item);
        _items.add(item);
        globals.signup_class_items = _items;
        globals.all_amount += int.parse(i['amount']) * int.parse(i['num']);
        // print(globals.shopbagitems);
        // print(i["text"]);
      }
      globals.signup_class_items = _items;
    });
  }

  List<SignupClassList> _tarikhche_items = [];
  Iterable _tarikhche_items_reversed;

  void getTarikhcheItems() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.http(globals.django_url, globals.signup_class_getall_url);
    print(url);
    Response response = await post(url, body: {"user": "maryam"});
    setState(() {
      _tarikhche_items = [];
      print(response.body);
      var itemsjson = json.decode(response.body)['result'];
      globals.all_amount_tarikhche = 0;

      for (var i in itemsjson) {
        var item = SignupClassList(
          i["username"],
          i["phonenumber"],
          i["tel_id"],
          i["address"],
          i["group"],
        );
        _tarikhche_items.add(item);

        globals.all_amount_tarikhche +=
            int.parse(i['amount']) * int.parse(i['num']);
      }

      setState(() {
        globals.signup_class_items = _tarikhche_items;
      });
      _tarikhche_items_reversed = _tarikhche_items.reversed;
    });
  }

  @override
  void initState() {
    super.initState();
    getTarikhcheItems();
  }

  final _controller = ScrollController();

  Card generateItemTarikhcheKharid(SignupClassList product, context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 5,
      child: Container(
        height: 350,
        child: InkWell(
          onTap: () {
            //var item_ = globals.pooshak_mardane_getall_res['result'][id]
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "نام کاربری ثبت نام کننده:",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          product.username,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "شماره تلفن ثبت نام کننده: ",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          product.phonenumber,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "آیدی ایتای ثبت نام کننده : ",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          product.eitaa_id,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "آدرس ثبت نام کننده : ",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          product.address,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "نوع کلاس ثبت نام کننده : ",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          product.group,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  var text;
  var BtnColor;

  void button_on_tap() {
    if (globals.signup_class_items.toString() == "[]") {
    } else {
      finished_bye();
    }
  }

  void setting() {
    print(globals.signup_class_items);
    if (globals.signup_class_items.toString() == "[]") {
      text = "\nسبد خرید شما خالی است";
      BtnColor = Colors.grey;
    } else {
      text = "";
      BtnColor = Colors.green;
    }
  }

  List<Tab> tabs = <Tab>[
    Tab(text: 'تاریخچه خرید'),
    Tab(text: 'سبد خرید'),
  ];

  /*

      */

  @override
  Widget build(BuildContext context) {
    setting();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تاریخچه خرید کاربران",
          style: TextStyle(color: Colors.black, fontFamily: 'Vazir'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: Icon(Icons.add),
      ),
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height - 150,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ListView.builder(
              shrinkWrap: true,
              controller: _controller,
              itemCount: globals.signup_class_items.length,
              itemBuilder: (context, index) {
                return generateItemTarikhcheKharid(
                    globals.signup_class_items.toList()[index], context);
              },
            ),
          ),
        ),
      ]),
      bottomNavigationBar: AppBottomTabBarLearn(),
    );
  }
}

// import 'package:flutter/material.dart';

// /// This is the main application widget.
// class ShopBagTab extends StatelessWidget {
//   const ShopBagTab({Key key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatelessWidget(),
//     );
//   }
// }

// const List<Tab> tabs = <Tab>[
//   Tab(text: 'Zeroth'),
//   Tab(text: 'First'),
//   Tab(text: 'Second'),
// ];

// /// This is the stateless widget that the main application instantiates.
// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   }
// }
