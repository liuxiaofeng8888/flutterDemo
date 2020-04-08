import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///广告轮播图
class SwipeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SwipeState();
  }
}

class SwipeState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("轮播图"),
        centerTitle: true,
      ),
      body: Swiper(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return new Image(image: AssetImage("image/lake.png"));
        },
      ),
    );
  }
}
