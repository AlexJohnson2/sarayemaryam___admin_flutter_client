import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'globals.dart' as globals;
import 'Product.dart';
import 'package:http/http.dart';
import 'Page__Discription.dart';
import 'dart:convert';
import 'StoreTab.dart';

class Page__AboutMe extends StatefulWidget {
  @override
  _Page__AboutMeState createState() => _Page__AboutMeState();
}

class _Page__AboutMeState extends State<Page__AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "سرای مریم",
            style: TextStyle(color: Colors.black, fontFamily: 'Vazir'),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          elevation: 2,
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                child: Text(
                    "سلام. من سیامک انصاری هستم و حالا اینجا چی کار می کنم. اومدم که براتون درباره این برنامه بگم :)",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20)))));
  }
}
