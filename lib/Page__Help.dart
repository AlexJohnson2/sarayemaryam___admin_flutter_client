import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'globals.dart' as globals;
import 'Product.dart';
import 'package:http/http.dart';
import 'Page__Discription.dart';
import 'dart:convert';
import 'StoreTab.dart';

class Page__Help extends StatefulWidget {
  @override
  _Page__HelpState createState() => _Page__HelpState();
}

class _Page__HelpState extends State<Page__Help> {
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
                    "برای استفاده از این برنامه:\n 1- باید به اینترنت متصل باشید. \n 2- باید شبکه اجتماعی ایتا بر روی گوشی شما نصب باشد \n\n روش سفارش کالا: \n 1- از صفحه فروشگاه ، وارد دسته بندی مورد نظر شوید. \n 2- پس از انتخاب کالای مورد نظر روی دکمه افزودن به سبد خرید کلیک کنید. \n 3- با کلیک شما سفارشتان به سبد خرید شما اضافه می شود. \n 4- در سبد خریدتان با فشردن دکمه ادامه خرید و تایین نوع دریافت کالا به صفحه مسئول فروش در ایتا هدایت می شوید . \n 5- مسئول فروش در همان لحظه یا در اسرع وقت برای نهایی کردن خرید به شما پیام خواهد داد .",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18)))));
  }
}
