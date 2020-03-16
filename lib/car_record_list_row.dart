import 'package:flutter/material.dart';

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
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  child: Text("纳智捷U5Ev"),
                ),
                Positioned(
                  child: Text("已取消"),
                  right: 20,
                )
              ],
            ),
            Text("2020-03-13"),
            Text("东方世纪中心"),
            Text("天台山路")
          ],
        ),
      ),
    );
  }
}
