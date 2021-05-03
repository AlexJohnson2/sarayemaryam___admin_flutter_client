import 'package:flutter/material.dart';
import 'ItemsList.dart';
import 'Product.dart';
import 'BottomTabBarShopBagTab.dart';
import 'globals.dart' as globals;
import 'Page__Pooshak_mardane.dart';
import 'ShopBagList.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'Page__Discription.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'FinishedByePage.dart';
import 'TarikhcheKharidList.dart';
import 'package:persian_date/persian_date.dart';

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

class ShopBagTab extends StatefulWidget {
  @override
  _ShopBagTabState createState() => _ShopBagTabState();
}

class _ShopBagTabState extends State<ShopBagTab> {
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

  // void delete_from_cart(name, amount, img) async {
  //   var url = Uri.http(globals.django_url, globals.delete_from_cart_url);
  //   Response response = await post(url, body: {
  //     "user": globals.username,
  //     "name": name,
  //     "amount": amount,
  //     "img": img,
  //   });
  //   getItems();
  // }

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
                    // delete_from_cart(name, amount, img);
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

  // void refresh() {
  //   setState(() {
  //     getItems();
  //   });
  // }

  List<ShopBagList> _items = [];

  // void getItems() async {
  //   var url = Uri.http(globals.django_url, globals.get_all_cart_url);
  //   print(url);
  //   Response response = await post(url, body: {"user": globals.username});
  //   setState(() {
  //     _items = [];
  //     var itemsjson = json.decode(response.body)['result'];
  //     // print(itemsjson);
  //     globals.all_amount = 0;
  //     for (var i in itemsjson) {
  //       // print(i['old_num']);
  //       var item = ShopBagList(
  //           int.parse(i['id']),
  //           i["name"],
  //           i["text"],
  //           i["amount"],
  //           i["img"],
  //           i["num"],
  //           i["number"],
  //           i['old_num'],
  //           i['group'],
  //           i['color'],
  //           i['size']);
  //       // print(item);
  //       _items.add(item);
  //       globals.shopbagitems = _items;
  //       globals.all_amount += int.parse(i['amount']) * int.parse(i['num']);
  //       // print(globals.shopbagitems);
  //       // print(i["text"]);
  //     }
  //     globals.shopbagitems = _items;
  //   });
  // }

  List<TarikhcheKharidList> _tarikhche_items = [];
  Iterable _tarikhche_items_reversed;

  void getTarikhcheItems() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.http(globals.django_url, globals.tarikhche_kharid_getall);
    print(url);
    Response response = await post(url, body: {"user": "maryam"});
    setState(() {
      _tarikhche_items = [];
      print(response.body);
      var itemsjson = json.decode(response.body)['result'];
      globals.all_amount_tarikhche = 0;

      for (var i in itemsjson) {
        var item = TarikhcheKharidList(
            int.parse(i['id']),
            // i["name"],
            // i["text"],
            // i["amount"],
            // i["img"],
            // i["num"],
            i["number"],
            // i['old_num'],
            // i['group'],
            i['eitaa_id'],
            i['address'],
            i['post_code'],
            // i['color'],
            // i['size'],
            i['username'],
            i['authority'],
            i['status'],
            i['date'],
            i['time'],
            // i['img2'],
            // i['img3'],
            // i['img4'],
            i['level_sabt'],
            i['level_amadeh_sazi'],
            i['level_tahvil_post'],
            i['kalas']);
        _tarikhche_items.add(item);
        // globals.all_amount_tarikhche +=
        //     int.parse(i['amount']) * int.parse(i['num']);
      }
      _tarikhche_items_reversed = _tarikhche_items.reversed;
    });
  }

  @override
  void initState() {
    super.initState();
    // getItems();
    getTarikhcheItems();
  }

  Card generateItem(ShopBagList product, context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 5,
      child: Container(
        height: 200,
        child: InkWell(
          onTap: () {
            //var item_ = globals.pooshak_mardane_getall_res['result'][id]

            var kala = Product(
                product.id,
                product.name,
                product.text,
                product.amount,
                product.img,
                product.num,
                "product.number",
                product.group,
                {},
                product.img2,
                product.img3,
                product.img4,
                null,
                null,
                null);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Page__Discription(kala, [])));
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    child: Image.network(
                      product.img,
                      width: 120,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          product.name,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          product.amount,
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_up,
                                size: 30,
                              ),
                              onPressed: () {
                                var num = int.parse(product.num);
                                var new_num = num += 1;
                                // print(new_num);
                                print(product.old_num);
                                if (new_num == int.parse(product.old_num) + 1) {
                                  // print(int.parse(product.old_num));
                                } else {
                                  edit_num(product.name, new_num);
                                  setState(() {
                                    setState(() {
                                      // getItems();
                                    });
                                  });
                                }
                              }),
                          Text(
                            product.num,
                            style: TextStyle(fontSize: 20),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 30,
                              ),
                              onPressed: () {
                                var num = int.parse(product.num);
                                var new_num = num -= 1;
                                if (new_num == 0) {
                                } else {
                                  edit_num(product.name, new_num);
                                  setState(() {
                                    setState(() {
                                      // getItems();
                                    });
                                  });
                                }
                              })
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            Sure_to_delete_cart_item(context, product.name,
                                product.amount, product.img);
                          })
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }

  final _controller = ScrollController();

  void ok_level_amadeh_sazi(username, name, date, time) async {
    var url =
        Uri.http(globals.django_url, "/tarikhche_kharid/ok_level_amadeh_sazi");
    Response response = await post(url,
        body: {"username": username, "name": name, 'date': date, 'time': time});
    print(response.body);
    setState(() {
      getTarikhcheItems();
    });
  }

  void ok_level_tahvil_post(username, name, date, time) async {
    var url =
        Uri.http(globals.django_url, "/tarikhche_kharid/ok_level_tahvil_post");
    Response response = await post(url,
        body: {"username": username, "name": name, 'date': date, 'time': time});
    print(response.body);
    setState(() {
      getTarikhcheItems();
    });
  }

  Card generateItemTarikhcheKharid(
      TarikhcheKharidList product, context, index) {
    PersianDate date = PersianDate.pDate();
    Widget status = Text(
      "وضعیت : " + "",
      style: TextStyle(fontSize: 20),
      textDirection: TextDirection.rtl,
    );
    if (product.status == "NOK") {
      status = Text(
        "وضعیت : " + "ناموفق",
        style: TextStyle(fontSize: 20, color: Colors.red),
        textDirection: TextDirection.rtl,
      );
    } else {
      status = Text(
        "وضعیت : " + "موفق",
        style: TextStyle(fontSize: 20, color: Colors.green),
        textDirection: TextDirection.rtl,
      );
    }
    var level_sabt_color = Colors.white;
    var level_sabt_color_text = Colors.black;
    var level_amadeh_sazi_color = Colors.white;
    var level_amadeh_sazi_color_text = Colors.black;
    var level_tahvil_post_color = Colors.white;
    var level_tahvil_post_color_text = Colors.black;
    if (product.level_sabt == "OK") {
      level_sabt_color = Colors.green;
      level_sabt_color_text = Colors.white;
    }
    if (product.level_amadeh_sazi == "OK") {
      level_amadeh_sazi_color = Colors.green;
      level_amadeh_sazi_color_text = Colors.white;
    }
    if (product.level_tahvil_post == "OK") {
      level_tahvil_post_color = Colors.green;
      level_tahvil_post_color_text = Colors.white;
    }

    var all_amount = 0;

    List<Widget> kala_list = [];
    int count = 0;
    for (var i in product.kalas['result']) {
      all_amount += int.parse(i['amount']) * int.parse(i['num']);
      kala_list.add(
        Container(
          color: Colors.black,
          height: 1,
        ),
      );
      kala_list.add(
        InkWell(
          onTap: () {
            var kala = Product(
                i['id'],
                i['name'],
                i['text'],
                i['amount'],
                i['img'],
                i['num'],
                "product.number",
                i['group'],
                i['color_size'],
                i['img2'],
                i['img3'],
                i['img4'],
                i['user'],
                i['phone'],
                i['city']);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Page__Discription(kala, [])));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: [
              Image.network(
                i['img'],
                width: 100,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      i['name'],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      i['amount'],
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "رنگ : " + i['color'],
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "سایز : " + i['size'],
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "تعداد : " + i['num'],
                      style: TextStyle(fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "شماره کالا : " + i['id'].toString(),
                      style: TextStyle(fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 5,
      child: Container(
        height: 700.0 + product.kalas['result'].length * 160,
        child: InkWell(
          onTap: () {
            //var item_ = globals.pooshak_mardane_getall_res['result'][id]

            var kala = Product(
                product.id,
                product.kalas['result'][index]['name'],
                product.kalas['result'][index]['text'],
                product.kalas['result'][index]['amount'],
                product.kalas['result'][index]['img'],
                product.kalas['result'][index]['num'],
                "product.number",
                product.kalas['result'][index]['group'],
                {},
                product.kalas['result'][index]['img2'],
                product.kalas['result'][index]['img3'],
                product.kalas['result'][index]['img4'],
                null,
                null,
                null);
            List Colors_values = [];

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Page__Discription(kala, [])));
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 5),
            child: Column(
              children: [
                Row(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              "نام کاربری فرد : ",
                              style: TextStyle(fontSize: 20),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              product.user,
                              style: TextStyle(fontSize: 20),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              "شماره سفارش : ",
                              style: TextStyle(fontSize: 20),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              product.id.toString(),
                              style: TextStyle(fontSize: 20, color: Colors.red),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 130,
                              child: Text(
                                "کد پیگیری پرداخت در صورت موفق بودن: ",
                                style: TextStyle(fontSize: 20),
                                maxLines: null,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              int.parse(product.authority.substring(1))
                                  .toString(),
                              style: TextStyle(fontSize: 17, color: Colors.red),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              "تاریخ : ",
                              style: TextStyle(fontSize: 20),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              date.parse(product.date)[0].toString() +
                                  '/' +
                                  date.parse(product.date)[1].toString() +
                                  '/' +
                                  date.parse(product.date)[2].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              "زمان : ",
                              style: TextStyle(fontSize: 20),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              product.time.toString(),
                              style: TextStyle(fontSize: 20),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: status),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              "مبلغ کل : " + all_amount.toString(),
                              style: TextStyle(fontSize: 20),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 3,
                  ),
                  child: Column(
                    children: kala_list,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: level_sabt_color,
                        borderRadius: BorderRadius.circular(40),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 50,
                                child: Text("ثبت سفارش",
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: level_sabt_color_text)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                        color: level_amadeh_sazi_color,
                        borderRadius: BorderRadius.circular(40),
                        child: InkWell(
                          onTap: () {
                            ok_level_amadeh_sazi(
                                product.user,
                                product.id.toString(),
                                product.date,
                                product.time);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 50,
                                child: Text(
                                  "آماده سازی سفارش",
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: level_amadeh_sazi_color_text),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                          color: level_tahvil_post_color,
                          borderRadius: BorderRadius.circular(40),
                          child: InkWell(
                            onTap: () {
                              ok_level_tahvil_post(
                                  product.user,
                                  product.id.toString(),
                                  product.date,
                                  product.time);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: Text(
                                    "تحویل سفارش به پست",
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: level_tahvil_post_color_text),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  var text;
  var BtnColor;

  void button_on_tap() {
    print("tapped");
  }

  void setting() {
    print("globals.shopbagitems");
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
              itemCount: _tarikhche_items.length,
              itemBuilder: (context, index) {
                return generateItemTarikhcheKharid(
                    _tarikhche_items_reversed.toList()[index], context, index);
              },
            ),
          ),
        ),
      ]),
      bottomNavigationBar: AppBottomTabBarShopBagTab(),
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
