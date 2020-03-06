import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

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
                width: 30,
                height: 30,
                image: AssetImage("image/login_close.png"),
              ),
              onTap: ()=>_back(context),),
              margin: const EdgeInsets.only(
                  left: 20, top: 100, right: 20, bottom: 30),
              alignment: Alignment.centerLeft,
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
                child: TextField(
              decoration: InputDecoration(hintText: "请输入手机号"),
              keyboardType: TextInputType.number,
            ),
            margin: EdgeInsets.only(bottom: 20),),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              border: Border.all()),
                child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(hintText: "请输入验证码"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Color(0xffCCFFFF),
                  textColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text("获取验证码"),
                )
              ],
            )),
            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.only(top: 20),
              child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("免注册登录"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
            ),
          ],
        ),
      ),
    );
  }

  ///返回到上一个页面
  _back(BuildContext context){
    Navigator.pop(context);
  }

  loginRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;
}
