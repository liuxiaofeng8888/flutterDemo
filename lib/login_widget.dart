import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class loginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            child: GestureDetector(
                child: Image(
              image: AssetImage("image/login_close.png"),
            )),
            margin: const EdgeInsets.only(left: 20,top: 150,right: 20,bottom: 0),
          ),
          Text("欢迎使用格上出行",style: TextStyle(fontSize: 25,
          color: Colors.black,
          decoration: TextDecoration.none,),)
        ],
      ),
    );
  }

  loginRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;
}
