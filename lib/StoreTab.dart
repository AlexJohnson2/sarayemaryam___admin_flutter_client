import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Page__Sefaresh_Sayer.dart';
import 'Page__Pooshak_zanane.dart';
import 'main.dart';
import 'BottomTabBarStore.dart';
import 'globals.dart' as globals;
import 'Product.dart';
import 'package:http/http.dart';
import 'Page__Discription.dart';
import 'dart:convert';
import 'Page__Pooshak_mardane.dart';
import 'ItemsList.dart';
import 'Page__Pooshak.dart';
import 'Page__Parcheh.dart';
import 'Page__Kharazi.dart';
import 'Page__Haraji.dart';
import 'Page__Hejab.dart';
import 'Page__Sefaresh_Sayer.dart';
import 'Page__Pishnahad_Vizhe.dart';
import 'Page__Zivar_alat.dart';
import 'Page__Users_kalas.dart';

class StoreTab extends StatefulWidget {
  @override
  _StoreTabState createState() => _StoreTabState();
}

class _StoreTabState extends State<StoreTab> {
  @override
  Widget build(BuildContext context) {
    var text = "سرای مریم";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          text,
          style: TextStyle(color: Colors.black, fontFamily: 'Vazir'),
        ),
        centerTitle: true,
        leading: Icon(Icons.add),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Stack(children: [
        ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "پوشاک مریم",
                    style: TextStyle(fontSize: 23),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Pooshak()));
                      },
                      child: Text(
                        "مشاهده همه",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(globals.pooshak_items.length,
                        (int position) {
                      return generateItem(
                          globals.pooshak_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "بازار کاربران",
                    style: TextStyle(fontSize: 23, color: Colors.black),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Users_kalas()));
                      },
                      child: Text(
                        "مشاهده همه",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(globals.users_kalas_items.length,
                        (int position) {
                      return generateItem(
                          globals.users_kalas_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "حراجی مریم",
                    style: TextStyle(fontSize: 23, color: Colors.red),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Haraji()));
                      },
                      child: Text(
                        "مشاهده همه",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(globals.haraj_items.length,
                        (int position) {
                      return generateItem(
                          globals.haraj_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "صنایع دستی مریم",
                    style: TextStyle(fontSize: 23, color: Colors.black),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Zivar_alat()));
                      },
                      child: Text(
                        "مشاهده همه",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(globals.sanaye_dasti_items.length,
                        (int position) {
                      return generateItem(
                          globals.sanaye_dasti_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "پیشنهاد ویژه مریم",
                    style: TextStyle(fontSize: 23, color: Colors.red),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Pishnahad_Vizhe()));
                      },
                      child: Text(
                        "مشاهده همه",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        globals.pishnahad_vizhe_items.length, (int position) {
                      return generateItem(
                          globals.pishnahad_vizhe_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "حراجی مریم",
                    style: TextStyle(fontSize: 23, color: Colors.red),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Haraji()));
                      },
                      child: Text(
                        "مشاهده همه",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(globals.haraj_items.length,
                        (int position) {
                      return generateItem(
                          globals.haraj_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "پارچه مریم",
                    style: TextStyle(fontSize: 23),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Parcheh()));
                      },
                      child: Text(
                        "مشاهده همه",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(globals.parcheh_items.length,
                        (int position) {
                      return generateItem(
                          globals.parcheh_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "خرازی مریم",
                    style: TextStyle(fontSize: 23),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Kharazi()));
                      },
                      child: Text(
                        "مشاهده همه",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(globals.kharazi_items.length,
                        (int position) {
                      return generateItem(
                          globals.kharazi_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "حجاب مریم",
                    style: TextStyle(fontSize: 23),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Hejab()));
                      },
                      child: Text(
                        "مشاهده همه",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(globals.hejab_items.length,
                        (int position) {
                      return generateItem(
                          globals.hejab_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "سفارش دوخت مریم",
                    style: TextStyle(fontSize: 23),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Page__Sefaresh_sayer()));
                      },
                      child: Text(
                        "سایر موارد",
                        style: TextStyle(fontSize: 18, color: Colors.blue[600]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Container(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: GridView.count(
                    reverse: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(globals.sefaresh_items.length,
                        (int position) {
                      return generateItem(
                          globals.sefaresh_items[position], context);
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: AppBottomTabBarStore(),
    );
  }
}

Card generateItem(ItemsList product, context) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    elevation: 5,
    child: InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => product.page));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              child: Image.network(product.img),
            ),
            Text(
              product.name,
              style: TextStyle(fontSize: 17),
            ),
            // Text(
            //   product.num,
            //   style: TextStyle(color: Colors.red),
            // ),
          ],
        ),
      ),
    ),
  );
}

Card generateItem_haraji(
  ItemsList product,
  context,
) {
  return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 5,
      child: Container(
        width: 200,
        child: InkWell(
          onTap: () {
            //var item_ = globals.pooshak_mardane_getall_res['result'][id]
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => product.page));
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(fontSize: 50, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ));
}
