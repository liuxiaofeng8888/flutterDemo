import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class loginRoute extends StatefulWidget {
  loginRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State {
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
                onTap: () => _back(context),
              ),
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
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all()),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "请输入手机号", border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      controller: _accountController,
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>_clearText(_accountController.text),
                    child: Image(
                        width: 20,
                        height: 20,
                        image: AssetImage("image/login_close.png")),
                  )
                ],
              ),
              margin: EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 20),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all()),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "请输入验证码", border: InputBorder.none),
                        keyboardType: TextInputType.number,
                        controller: _passwordController,
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
                  onPressed: () {
                    _login();
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("免注册登录"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100))),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  ///返回到上一个页面
  _back(BuildContext context) {
    Navigator.pop(context);
  }

  ///登录
  _login() {
    print(_accountController.text);
  }

  ///清空账号
  _clearText(String account) {
    print("清空账号");
    setState(() {
      _accountController.clear();
    });
  }

  static String _inputString = "";

  TextEditingController _accountController =
      TextEditingController.fromValue(TextEditingValue(text: _inputString));
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      print(_passwordController.text);
    });
  }
}
