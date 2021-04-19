import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'globals.dart' as globals;
import 'Product.dart';
import 'package:http/http.dart';
import 'Page__Discription.dart';
import 'dart:convert';
import 'StoreTab.dart';

class Page__Kharazi extends StatefulWidget {
  @override
  _Page__KharaziState createState() => _Page__KharaziState();
}

class _Page__KharaziState extends State<Page__Kharazi> {
  List<Product> _items = [];

  void getItems() async {
    var url = Uri.http(globals.django_url, globals.kharazi_getall_url);
    Response response = await get(url);
    setState(() {
      _items = [];
      globals.items = [];
      print(jsonDecode(response.body));
      var itemsjson = json.decode(response.body)['result'];
      for (var i in itemsjson) {
        var item = Product(
            i['id'],
            i['name'],
            i['text'],
            i['amount'],
            i['img'],
            i['num'],
            i['number'],
            i['group'],
            i['color_size'],
            i['img2'],
            i['img3'],
            i['img4']);
        _items.add(item);
        globals.items = _items;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = [];
      globals.items = [];
    });
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    getItems();
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            child: Container(
              height: MediaQuery.of(context).size.height - 60,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: globals.items.length,
                  itemBuilder: (context, index) {
                    return generateItem(globals.items[index], context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void check(product) async {
  var url = Uri.http(globals.django_url, globals.get_all_cart_url);
  Response response = await post(url, body: {"user": globals.username});
  var this_kala = {
    "id": product.id.toString(),
    "name": product.name,
    "amount": product.amount,
    "img": product.img,
    "num": product.num
  };

  if (jsonDecode(response.body)['result'].toString().contains(product.name)) {
    print(product.name);
  }
  if (jsonDecode(response.body)['result'].toString().contains(product.name)) {
    globals.to_cart = true;
  } else {
    globals.to_cart = false;
  }
}

Card generateItem(Product product, context) {
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
              product.color_size,
              product.img2,
              product.img3,
              product.img4);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Page__Discription(kala, false)));
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 5),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      child: Image.network(
                        product.img,
                        width: 100,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 250,
                            child: Text(
                              product.name,
                              maxLines: null,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 20),
                            ),
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
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              product.num,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )
                      ],
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
