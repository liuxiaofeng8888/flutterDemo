import 'package:flutter/material.dart';

class loginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }

  loginRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;
}
