import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///乘车记录的item
class CarRecordRow extends StatelessWidget {
  String name;
  String orderType;
  String time;

  CarRecordRow(this.name, this.orderType, this.time);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => {
        Fluttertoast.showToast(msg: "item的点击事件",gravity: ToastGravity.CENTER)
      },
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("纳智捷U5Ev"),
                  ),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("已取消"),
                      ],
                    ),
                    right: 20,
                  )
                ],
              ),
            ),
            Container(
              child: Text("2020-03-13"),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("东方世纪中心"),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("天台山路"),
            ),
          ],
        ),
      ),
    );
  }
}
