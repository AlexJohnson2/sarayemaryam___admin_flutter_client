import 'dart:convert';
import 'Page__Sefaresh_Sayer.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'Page__Discription.dart';
import 'Product.dart';
import 'package:flutter/material.dart';
import 'BottomTabBar.dart';
import 'package:http/http.dart';
import 'globals.dart' as globals;
import 'SigninPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'Page__Help.dart';
import 'Page__AboutMe.dart';
import 'SetDastebandiPage.dart';
import 'SetColorPage.dart';
import 'Page__Hejab.dart';
import 'Page__Haraji.dart';
import 'Page__Hejab_Chador.dart';
import 'Page__Hejab_Mask_Pooshie.dart';
import 'Page__Hejab_Roosari.dart';
import 'Page__Hejab_Saghedast_Dastkesh.dart';
import 'Page__Hejab_Shal.dart';
import 'Page__Kharazi.dart';
import 'Page__Kharazi_Abzar.dart';
import 'Page__Kharazi_Lavazem_Tahrir.dart';
import 'Page__Parcheh.dart';
import 'Page__Pooshak.dart';
import 'Page__Pooshak_dokhtarane.dart';
import 'Page__Pooshak_mardane.dart';
import 'Page__Pooshak_nozadi.dart';
import 'Page__Pooshak_pesarane.dart';
import 'Page__Pooshak_zanane.dart';
import 'Page__Sefaresh_Pooshak_Dokhtarane.dart';
import 'Page__Sefaresh_Pooshak_Mardane.dart';
import 'Page__Sefaresh_Pooshak_Nozadi.dart';
import 'Page__Sefaresh_Pooshak_Pesarane.dart';
import 'Page__Sefaresh_Pooshak_Zanane.dart';

void main() async {
  if (2 == 2) {
    runApp(SigninMaterial());
  } else {
    runApp(MainMaterial());
  }
}
//void main() { runApp(SigninPage()); }

class MainMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sarayemaryam(),
      title: "سرای مریم",
      theme: ThemeData(fontFamily: "Vazir"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/kala/hejab': (context) => Page__Hejab(),
        '/kala/hejab_shal': (context) => Page__Hejab_Shal(),
        '/kala/hejab_roosari': (context) => Page__Hejab_Roosari(),
        '/kala/hejab_mask_pooshie': (context) => Page__Hejab_Mask_Pooshie(),
        '/kala/hejab_saghedast_dastkesh': (context) =>
            Page__Hejab_Saghedast_Dastkesh(),
        '/kala/hejab_chador': (context) => Page__Hejab_Chador(),
        '/kala/kharazi': (context) => Page__Kharazi(),
        '/kala/kharazi_abzarkhayati': (context) => Page__Kharazi_Abzar(),
        '/kala/kharazi_lavazemtahrir': (context) =>
            Page__Kharazi_Lavazem_Tahrir(),
        '/kala/pooshak': (context) => Page__Pooshak(),
        '/kala/pooshak_mardane': (context) => Page__Pooshak_mardane(),
        '/kala/pooshak_zanane': (context) => Page__Pooshak_zanane(),
        '/kala/pooshak_pesarane': (context) => Page__Pooshak_pesarane(),
        '/kala/pooshak_dokhtarane': (context) => Page__Pooshak_dokhtarane(),
        '/kala/pooshak_nozadi': (context) => Page__Pooshak_nozadi(),
        '/kala/sefaresh_pooshak_mardane': (context) =>
            Page__Sefaresh_Pooshak_mardane(),
        '/kala/sefaresh_pooshak_zanane': (context) =>
            Page__Sefaresh_Pooshak_zanane(),
        '/kala/sefaresh_pooshak_pesarane': (context) =>
            Page__Sefaresh_Pooshak_pesarane(),
        '/kala/sefaresh_pooshak_dokhtarane': (context) =>
            Page__Sefaresh_Pooshak_dokhtarane(),
        '/kala/sefaresh_pooshak_nozadi': (context) =>
            Page__Sefaresh_Pooshak_nozadi(),
        '/kala/sefaresh_pooshak_sayer': (context) => Page__Sefaresh_sayer(),
      },
    );
  }
}

class SigninMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SigninPage(),
      title: "سرای مریم",
      theme: ThemeData(fontFamily: "Vazir"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => Sarayemaryam(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      // },
    );
  }
}

void set_variable() async {
  SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  globals.username = sharedPreferences.getString('username');
  globals.password = sharedPreferences.getString('password');
  globals.phonenumber = sharedPreferences.getString('phonenumber');
  globals.eitaa_id = sharedPreferences.getString('eitaa_id');
  globals.address = sharedPreferences.getString('address');
  globals.post_code = sharedPreferences.getString('post_code');
}

class Sarayemaryam extends StatefulWidget {
  @override
  _SarayemaryamState createState() => _SarayemaryamState();
}

class _SarayemaryamState extends State<Sarayemaryam> {
  var namecontroller = TextEditingController();
  var textcontroller = TextEditingController();
  var usercontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var citycontroller = TextEditingController();
  var amountcontroller = TextEditingController();
  var imagecontroller = TextEditingController(text: "");
  var image2controller = TextEditingController(text: "");
  var image3controller = TextEditingController(text: "");
  var image4controller = TextEditingController(text: "");
  var mojoodicontroller = TextEditingController();

  void AddError(context, text, button_text) {
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

  var mojood_placeholder = "موجودی محصول";
  var mojood_icon_color = Colors.black38;

  bool namojood = false;

  void add_kala(name, text, amount, image, mojoodi, dastebandi, context, image2,
      image3, image4, user, phone, city) async {
    print(json.encode(globals.new_color_size));

    var url = Uri.http(
        globals.django_url,
        "kala/" +
            dastebandi.toString().substring(15, dastebandi.toString().length) +
            "/add");
    print(url);
    var this_mojoodi;
    if (namojood == true) {
      var this_mojoodi = 0;
    } else {
      var this_mojoodi = mojoodi;
    }
    Response response = await post(url, body: {
      "name": name.toString(),
      "text": text.toString(),
      "amount": amount.toString(),
      "img": image.toString(),
      "img2": image2.toString(),
      "img3": image3.toString(),
      "img4": image4.toString(),
      "num": this_mojoodi.toString(),
      "color_size": json.encode(globals.new_color_size).toString(),
      'user': user,
      'phone': phone,
      'city': city
    });
    print(response.body);

    namecontroller.clear();
    textcontroller.clear();
    amountcontroller.clear();
    imagecontroller.clear();
    image2controller.clear();
    image3controller.clear();
    image4controller.clear();
    mojoodicontroller.clear();
    usercontroller.clear();
    phonecontroller.clear();
    citycontroller.clear();
    imagename = "آپلود عکس اول";
    imagename2 = "آپلود عکس دوم";
    imagename3 = "آپلود عکس سوم";
    imagename4 = "آپلود عکس چهارم";
    globals.new_color_size = {};

    if (json.decode(response.body)['status'] == "ok") {
      AddError(context, "کالا با موفقیت افزوده شد.", "باشه");
    } else {
      AddError(context, "در افزودن کالا مشکلی به وجود امده است.", "باشه");
    }
    // setState(() {
    //   // imagename = "";
    // });
  }

  void initState() {
    super.initState();
    // if (globals.add_dastebandi_btn_text == "") {
    //   globals.add_dastebandi_btn_text = "...............بدون دسته بندی";
    // } else if (globals.add_dastebandi_btn_text == "pooshak_mardane") {
    //   globals.add_dastebandi_btn_text = "پوشاک مردانه";
    // } else if (globals.add_dastebandi_btn_text == "pooshak_zanane") {
    //   globals.add_dastebandi_btn_text = "پوشاک زنانه";
    // } else if (globals.add_dastebandi_btn_text == "pooshak_pesarane") {
    //   globals.add_dastebandi_btn_text = "پوشاک پسرانه";
    // } else if (globals.add_dastebandi_btn_text == "pooshak_dokhtarane") {
    //   globals.add_dastebandi_btn_text = "پوشاک دخترانه";
    // } else if (globals.add_dastebandi_btn_text == "pooshak_nozadi") {
    //   globals.add_dastebandi_btn_text = "پوشاک نوزادی";
    // } else if (globals.add_dastebandi_btn_text == "parcheh") {
    //   globals.add_dastebandi_btn_text = "پارچه";
    // } else if (globals.add_dastebandi_btn_text == "kharazi_abzarkhayati") {
    //   globals.add_dastebandi_btn_text = "خرازی ابزار خیاطی";
    // } else if (globals.add_dastebandi_btn_text == "kharazi_lavazemtahrir") {
    //   globals.add_dastebandi_btn_text = "خرازی لوازم التحریر";
    // } else if (globals.add_dastebandi_btn_text == "hejab_chador") {
    //   globals.add_dastebandi_btn_text = "حجاب چادر";
    // } else if (globals.add_dastebandi_btn_text == "hejab_shal") {
    //   globals.add_dastebandi_btn_text = "حجاب شال";
    // } else if (globals.add_dastebandi_btn_text == "hejab_roosari") {
    //   globals.add_dastebandi_btn_text = "حجاب روسری";
    // } else if (globals.add_dastebandi_btn_text == "hejab_saghedast_dastkesh") {
    //   globals.add_dastebandi_btn_text = "حجاب ساق دست دستکش";
    // } else if (globals.add_dastebandi_btn_text == "hejab_mask_pooshie") {
    //   globals.add_dastebandi_btn_text = "حجاب ماسک پوشیه";
    // }
  }

  Upload(File imageFile, context) async {
    var stream = new ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://193.176.243.61/media/upload.php");
    var request = new MultipartRequest("POST", uri);
    var multipartFile = new MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    //contentType: new MediaType('image', 'png'));
    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      if (value == "successfully") {
      } else if (value == "already exists") {
        AddError(context, "فایل اپلود نشد. لطفا دوباره امتحان کنید.", "باشه");
      }
    });
  }

  File sampleImage;
  String imagename = "آپلود عکس اول";
  String imagename2 = "آپلود عکس دوم";
  String imagename3 = "آپلود عکس سوم";
  String imagename4 = "آپلود عکس چهارم";

  Future getImage1(context) async {
    File tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagename = basename(tempImage.path);
      sampleImage = tempImage;
      Upload(sampleImage, context);
    });
  }

  Future getImage2(context) async {
    File tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagename2 = basename(tempImage.path);
      sampleImage = tempImage;
      Upload(sampleImage, context);
    });
  }

  Future getImage3(context) async {
    File tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagename3 = basename(tempImage.path);
      sampleImage = tempImage;
      Upload(sampleImage, context);
    });
  }

  Future getImage4(context) async {
    File tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagename4 = basename(tempImage.path);
      sampleImage = tempImage;
      Upload(sampleImage, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    set_variable();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "سرای مریم",
          style: TextStyle(color: Colors.black, fontFamily: 'Vazir'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: Icon(Icons.add),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
          child: Column(children: [
            Text(
              "افزودن کالای جدید",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Material(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "نام محصول",
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.assignment_outlined,
                        color: Colors.black38,
                      ),
                    )),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                controller: namecontroller,
              ),
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "توضیحات محصول",
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.work_outline,
                        color: Colors.black38,
                      ),
                    )),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                controller: textcontroller,
              ),
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "قیمت محصول",
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.credit_card_outlined,
                        color: Colors.black38,
                      ),
                    )),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                controller: amountcontroller,
              ),
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Material(
            //   child: TextField(
            //     keyboardType: TextInputType.multiline,
            //     maxLines: null,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: "آدرس عکس اول",
            //         hintStyle: TextStyle(color: Colors.black38),
            //         contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //         icon: Padding(
            //           padding: EdgeInsets.only(left: 15),
            //           child: Icon(
            //             Icons.image_outlined,
            //             color: Colors.black38,
            //           ),
            //         )),
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 20),
            //     controller: imagecontroller,
            //   ),
            //   elevation: 20,
            //   borderRadius: BorderRadius.circular(40),
            // ),
            // SizedBox(
            //   height: 15,
            // ),

            // Material(
            //   child: TextField(
            //     keyboardType: TextInputType.multiline,
            //     maxLines: null,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: "آدرس عکس دوم",
            //         hintStyle: TextStyle(color: Colors.black38),
            //         contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //         icon: Padding(
            //           padding: EdgeInsets.only(left: 15),
            //           child: Icon(
            //             Icons.image_outlined,
            //             color: Colors.black38,
            //           ),
            //         )),
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 20),
            //     controller: image2controller,
            //   ),
            //   elevation: 20,
            //   borderRadius: BorderRadius.circular(40),
            // ),
            // SizedBox(
            //   height: 15,
            // ),

            // Material(
            //   child: TextField(
            //     keyboardType: TextInputType.multiline,
            //     maxLines: null,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: "آدرس عکس سوم",
            //         hintStyle: TextStyle(color: Colors.black38),
            //         contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //         icon: Padding(
            //           padding: EdgeInsets.only(left: 15),
            //           child: Icon(
            //             Icons.image_outlined,
            //             color: Colors.black38,
            //           ),
            //         )),
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 20),
            //     controller: image3controller,
            //   ),
            //   elevation: 20,
            //   borderRadius: BorderRadius.circular(40),
            // ),
            // SizedBox(
            //   height: 15,
            // ),

            // Material(
            //   child: TextField(
            //     keyboardType: TextInputType.multiline,
            //     maxLines: null,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: "آدرس عکس چهارم",
            //         hintStyle: TextStyle(color: Colors.black38),
            //         contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //         icon: Padding(
            //           padding: EdgeInsets.only(left: 15),
            //           child: Icon(
            //             Icons.image_outlined,
            //             color: Colors.black38,
            //           ),
            //         )),
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 20),
            //     controller: image4controller,
            //   ),
            //   elevation: 20,
            //   borderRadius: BorderRadius.circular(40),
            // ),
            // SizedBox(
            //   height: 15,
            // ),

            SizedBox(height: 15),
            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  getImage1(context);
                },
                child: Container(
                  width: 500,
                  height: 50,
                  child: Center(
                      child: Text(
                    imagename.toString(),
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  getImage2(context);
                },
                child: Container(
                  width: 500,
                  height: 50,
                  child: Center(
                      child: Text(
                    imagename2.toString(),
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  getImage3(context);
                },
                child: Container(
                  width: 500,
                  height: 50,
                  child: Center(
                      child: Text(
                    imagename3.toString(),
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  getImage4(context);
                },
                child: Container(
                  width: 500,
                  height: 50,
                  child: Center(
                      child: Text(
                    imagename4.toString(),
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //
            //
            // Row(
            //   textDirection: TextDirection.rtl,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "ناموجود؟",
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     Transform.scale(
            //       scale: 1.2,
            //       child: Switch(
            //           activeColor: Colors.red,
            //           value: namojood,
            //           onChanged: (value) {
            //             setState(() {
            //               namojood = value;
            //               if (value) {
            //                 mojood_placeholder = "";
            //                 mojood_icon_color = Colors.white;
            //               } else {
            //                 mojood_placeholder = "موجودی محصول";
            //                 mojood_icon_color = Colors.black38;
            //               }
            //             });
            //           }),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Material(
            //   child: TextField(
            //     enabled: !namojood,
            //     decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: mojood_placeholder,
            //         hintStyle: TextStyle(color: Colors.black38),
            //         contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //         icon: Padding(
            //           padding: EdgeInsets.only(left: 15),
            //           child: Icon(
            //             Icons.format_list_numbered_rounded,
            //             color: mojood_icon_color,
            //           ),
            //         )),
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 20),
            //     controller: mojoodicontroller,
            //   ),
            //   elevation: 20,
            //   borderRadius: BorderRadius.circular(40),
            // ),
            // SizedBox(height: 15),

            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SetDastebandiPage()));
                },
                child: Container(
                  width: 500,
                  height: 50,
                  child: Center(
                      child: Text(
                    "انتخاب دسته بندی",
                    style: TextStyle(color: Colors.black38, fontSize: 20),
                  )),
                ),
              ),
            ),
            // SizedBox(height: 15),
            // Center(
            //     child: Text(
            //   "دسته بندی : " +
            //       globals.add_dastebandi
            //           .toString()
            //           .substring(15, globals.add_dastebandi.toString().length),
            //   style: TextStyle(color: Colors.black, fontSize: 20),
            //   textDirection: TextDirection.rtl,
            // )),
            SizedBox(
              height: 15,
            ),
            Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  globals.new_color_size = {"result": []};
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SetColorPage()));
                },
                child: Container(
                  width: 500,
                  height: 50,
                  child: Center(
                      child: Text(
                    "انتخاب رنگ",
                    style: TextStyle(color: Colors.black38, fontSize: 20),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Material(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "نام کاربر",
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.credit_card_outlined,
                        color: Colors.black38,
                      ),
                    )),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                controller: usercontroller,
              ),
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
            ),
            SizedBox(height: 15),

            Material(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "شماره تلفن کاربر",
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.credit_card_outlined,
                        color: Colors.black38,
                      ),
                    )),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                controller: phonecontroller,
              ),
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
            ),
            SizedBox(height: 15),
            Material(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "شهر توزیع کالا برای کاربر",
                    hintStyle: TextStyle(color: Colors.black38),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.credit_card_outlined,
                        color: Colors.black38,
                      ),
                    )),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                controller: citycontroller,
              ),
              elevation: 20,
              borderRadius: BorderRadius.circular(40),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(40),
                color: Colors.lightBlue,
                child: InkWell(
                  onTap: () {
                    add_kala(
                        namecontroller.text,
                        textcontroller.text,
                        amountcontroller.text,
                        imagename,
                        mojoodicontroller.text,
                        globals.add_dastebandi,
                        context,
                        imagename2,
                        imagename3,
                        imagename4,
                        usercontroller.text,
                        phonecontroller.text,
                        citycontroller.text);
                    // getImage();
                  },
                  child: Container(
                    width: 500,
                    height: 50,
                    child: Center(
                        child: Text(
                      "افزودن کالا",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ]),
        ),
      ]),
      bottomNavigationBar: AppBottomTabBar(),
    );
  }
}

Card generateItem(Product product, context) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    elevation: 5,
    child: InkWell(
      onTap: () {
        //var item_ = globals.pooshak_mardane_getall_res['result'][id]
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Page__Discription(product, [])));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 120,
              child: Image.network(product.img),
            ),
            Text(
              product.name,
              style: TextStyle(fontSize: 17),
            ),
            Text(
              product.amount.toString(),
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    ),
  );
}
