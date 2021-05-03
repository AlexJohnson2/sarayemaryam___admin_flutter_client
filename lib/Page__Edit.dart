import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'Product.dart';
import 'globals.dart' as globals;
import 'SetColorPage.dart';
import 'SetDastebandiPage.dart';
import 'package:http/http.dart';
import 'dart:io';
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

File sampleImage;
String imagename;
String imagename2;
String imagename3;
String imagename4;

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

class Page__Edit extends StatefulWidget {
  Product product;
  Page__Edit(this.product);
  @override
  _Page__EditState createState() => _Page__EditState(this.product);
}

class _Page__EditState extends State<Page__Edit> {
  final Product product;
  _Page__EditState(this.product);

  void edit_kala(name, text, img, amount, color_size, img2, img3, img4, user,
      phone, city) async {
    var url = Uri.http(globals.django_url, "kala/" + product.group + "/edit");
    print(url);
    Response response = await post(url, body: {
      "id": product.id.toString(),
      "name": name,
      "text": text,
      "img": img,
      "img2": img2,
      "img3": img3,
      "img4": img4,
      "amount": amount,
      "num": product.num,
      "color_size": jsonEncode(color_size).toString(),
      'user': user,
      'phone': phone,
      'city': city
    });
    print(response.body);
    print(response.body);
    print(response.body);
    print(response.body);
    print(response.body);
    print(response.body);
    print(response.body);
    print(response.body);
    print(response.body);
    print(jsonEncode(color_size).toString());
  }

  @override
  void initState() {
    super.initState();
    print(globals.edit_color_size);
    globals.new_color_size = product.color_size;
    File sampleImage;
    setState(() {
      imagename = product.img.substring(28, product.img.length);
      imagename2 = product.img2.substring(28, product.img2.length);
      imagename3 = product.img3.substring(28, product.img3.length);
      imagename4 = product.img4.substring(28, product.img4.length);
    });
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
    var namecontroller = TextEditingController(text: product.name);
    var textcontroller = TextEditingController(text: product.text);
    var amountcontroller = TextEditingController(text: product.amount);
    var imagecontroller = TextEditingController(
        text: product.img.substring(28, product.img.length));
    var image2controller = TextEditingController(
        text: product.img2.substring(28, product.img2.length));
    var image3controller = TextEditingController(
        text: product.img3.substring(28, product.img3.length));
    var image4controller = TextEditingController(
        text: product.img4.substring(28, product.img4.length));
    var mojoodicontroller = TextEditingController();
    var usercontroller = TextEditingController(text: product.user);
    var phonecontroller = TextEditingController(text: product.phone);
    var citycontroller = TextEditingController(text: product.city);
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
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
          child: Column(
            children: [
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
              // SizedBox(height: 15),
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
              Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    globals.new_color_size = {"result": []};
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SetColorPage()));
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
              SizedBox(height: 15),
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
                      edit_kala(
                          namecontroller.text,
                          textcontroller.text,
                          imagename,
                          amountcontroller.text,
                          globals.new_color_size,
                          imagename2,
                          imagename3,
                          imagename4,
                          usercontroller.text,
                          phonecontroller.text,
                          citycontroller.text);
                      Navigator.pop(context, true);
                      // setState(() {});
                    },
                    child: Container(
                      width: 500,
                      height: 50,
                      child: Center(
                          child: Text(
                        "ویرایش کالا",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
