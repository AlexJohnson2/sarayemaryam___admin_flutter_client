import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'Product.dart';

class ImageView extends StatefulWidget {
  Product src;
  int img;
  ImageView(this.src, this.img);
  @override
  _ImageViewState createState() => _ImageViewState(this.src, this.img);
}

class _ImageViewState extends State<ImageView> {
  Product src;
  int img;
  _ImageViewState(this.src, this.img);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(this.src);
  }

  List<Tab> tabs = <Tab>[
    Tab(text: 'تاریخچه خرید'),
    Tab(text: 'سبد خرید'),
    Tab(text: 'vc خرید'),
    Tab(text: 'czvdbf خرید'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        // The Builder widget is used to have a different BuildContext to access
        // closest DefaultTabController.
        initialIndex: img,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return TabBarView(
            children: [
              Container(
                  color: Colors.black,
                  child: PhotoView(
                    imageProvider: NetworkImage(src.img),
                  )),
              Container(
                  color: Colors.black,
                  child: PhotoView(
                    imageProvider: NetworkImage(src.img2),
                  )),
              Container(
                  color: Colors.black,
                  child: PhotoView(
                    imageProvider: NetworkImage(src.img3),
                  )),
              Container(
                  color: Colors.black,
                  child: PhotoView(
                    imageProvider: NetworkImage(src.img4),
                  ))
            ],
          );
        }));
    // return Container(
    //     color: Colors.black,
    //     child: PhotoView(
    //       imageProvider: NetworkImage(src.img),
    //     ));
  }
}
