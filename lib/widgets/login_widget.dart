import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/webview_widget.dart';

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
  bool _checkboxSelected = true;

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
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "请输入手机号", border: InputBorder.none),
                      keyboardType: TextInputType.number,
                      controller: _accountController,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11)
                      ],
                    ),
                  ),
                  Positioned(
                      right: 20,
                      child: GestureDetector(
                        onTap: () => _clearText(_accountController.text),
                        child: Image(
                            width: 20,
                            height: 20,
                            image: AssetImage("image/login_close.png")),
                      ))
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
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "请输入验证码", border: InputBorder.none),
                        keyboardType: TextInputType.number,
                        controller: _passwordController,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6)
                        ],
                      ),
                    ),
                    Positioned(
                        right: 10,
                        child: RaisedButton(
                          onPressed: () {
                            if (_countDownTime == 0) {
                              _startCountDown();
                            }
                          },
                          color: Color(0xffCCFFFF),
                          textColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(_handleCodeText()),
                        ))
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
            Row(
              children: <Widget>[
                Checkbox(
                    value: _checkboxSelected,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _checkboxSelected = value;
                      });
                    }),
                Text("我已阅读并同意"),
                InkWell(
                  child: Text(
                    "《会员注册协议》",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return WebViewWidget(text: "会员注册协议",);
                        }));
                  },
                ),
                InkWell(
                  child: Text(
                    "《隐私协议》",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return WebViewWidget(text: "隐私协议",);
                        }));
                  },
                )
              ],
            )
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

  Timer _timer;
  var _countDownTime = 0;

  ///倒计时方法
  _startCountDown() {
    _countDownTime = 60;
    final call = (_timer) {
      setState(() {
        if (_countDownTime < 1) {
          _timer.cancel();
        } else {
          _countDownTime -= 1;
        }
      });
    };
    _timer = Timer.periodic(Duration(seconds: 1), call);
  }

  ///获取验证码按钮文案
  String _handleCodeText() {
    if (_countDownTime > 0) {
      return "${_countDownTime}s";
    } else {
      return "获取验证码";
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
