import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Isolate_widget.dart';
import 'package:flutter_app/widgets/animation_widget.dart';
import 'package:flutter_app/widgets/drawer_widget.dart';
import 'package:flutter_app/widgets/swipe_widget.dart';
import 'package:flutter_app/widgets/take_photo_widget2.dart';

import 'widgets/login_widget.dart';

///主页面
class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: Text("测试入口"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 0, top: 10, right: 0, bottom: 10),
                child: GestureDetector(
                  child: Text(
                    "登录页面",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return loginRoute(
                        text: "点击图片带过来的文案",
                      );
                    }));
                  },
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              new Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 0, top: 10, right: 0, bottom: 10),
                child: GestureDetector(
                  child: Text(
                    "抽屉页面",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DrawerWidget();
                    }));
                  },
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              new Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 0, top: 10, right: 0, bottom: 10),
                child: GestureDetector(
                  child: Text(
                    "Isolate测试",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return IsolateWidget();
                    }));
                  },
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              new Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 0, top: 10, right: 0, bottom: 10),
                child: GestureDetector(
                  child: Text(
                    "调用拍照",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TakePhotoWidget2();
                    }));
                  },
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              new Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 0, top: 10, right: 0, bottom: 10),
                child: GestureDetector(
                  child: Text(
                    "banner页面",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SwipeWidget();
                    }));
                  },
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              new Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 0, top: 10, right: 0, bottom: 10),
                child: GestureDetector(
                  child: Text(
                    "动画页面",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(seconds: 3),
                            pageBuilder: (BuildContext context,
                                Animation animation,
                                Animation secondaryAnimation) {
                              return new FadeTransition(
                                opacity: animation,
                                child: AnimationWidget(),
                              );
                            }));
                  },
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              )
            ],
          ),
        ));
  }
}
