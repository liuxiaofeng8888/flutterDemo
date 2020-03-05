import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class loginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child: GestureDetector(
                  child: Image(
                image: AssetImage("image/login_close.png"),
              )),
              margin: const EdgeInsets.only(
                  left: 20, top: 150, right: 20, bottom: 0),
            ),
            Text(
              "欢迎使用格上出行",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(hintText: "请输入手机号"),
                    keyboardType: TextInputType.number,
                  )),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: "请输入验证码"),
              keyboardType: TextInputType.number,
            ),
            FlatButton(onPressed: null, 
              child: Text("免注册登录"),
            color: Colors.blue,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
          ],
        ),
      ),
    );
  }

  loginRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;
}
