import 'package:flutter/material.dart';
import 'package:flutter_app/car_record_list.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawerState();
  }
}

class DrawerState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: SizedBox(
        width: 240,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 40),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: Image(image: AssetImage("image/default_head.png")),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "新用户",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("乘车记录"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return CarRecord(
                        );
                      }));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("我的钱包"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("乘车记录"),
                onTap: () {},
              ),
              ListTile(
//                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                leading: Icon(Icons.settings),
                title: Text("更多设置"),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(title: Text("Drawer")),
      body: Center(
        child: Text("这是抽屉页面"),
      ),
    );
  }
}
