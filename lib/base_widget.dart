import 'package:flutter/material.dart';
import 'package:flutter_app/login_widget.dart';
import 'package:flutter_app/stateful_demo.dart';

///布局小尝试
class MyBaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///文字和图标部分
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(color: Colors.grey[500]),
              ),
            ],
          )),
//          new Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
//          new Text('41')
          new FavoriteWidget()
        ],
      ),
    );

    ///创建按钮和文字
    Column buildButtonColum(IconData iconData, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            iconData,
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    ///按钮部分
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColum(Icons.call, 'CALL'),
          buildButtonColum(Icons.near_me, 'ROUTE'),
          buildButtonColum(Icons.share, 'SHARE'),
        ],
      ),
    );

    ///文本框部分
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
''',
        softWrap: true,
      ),
    );

    ///图片部分
    Widget imageSection = new Container(
        child: GestureDetector(
      child: new Image.asset(
        'image/lake.png',
        width: 600.0,
        height: 240.0,
        fit: BoxFit.cover,
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return loginRoute(
            text: "点击图片带过来的文案",
          );
        }));
      },
    ));

    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          imageSection,
          titleSection,
          buttonSection,
          textSection
        ],
      ),
    );
  }
}
