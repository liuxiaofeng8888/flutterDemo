import 'package:flutter/material.dart';

///使用规则弹窗
class UseRuleDialogWidget extends Dialog {
  String title; //标题
  String content; //内容

  UseRuleDialogWidget(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 275,
          height: 420,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                width: 275,
                height: 350,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(title),
                      margin: EdgeInsets.only(top: 18),
                    ),
                    Container(
                      height: 300,
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text(
                              content,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              GestureDetector(
                child: Image(
                  image: AssetImage("image/default_head.png"),
                  width: 38,
                  height: 38,
                ),
                onTap: () => {Navigator.of(context).pop(true)},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
