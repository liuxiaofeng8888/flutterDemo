import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/car_record_list_row.dart';
import 'package:flutter_app/widgets/use_rule_dialog_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

///乘车记录列表
class CarRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CarRecordState();
  }
}

class CarRecordState extends State with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["未完成", "完成"];
  static const loadingTag = "##loading##";
  var _words = [loadingTag];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          setState(() {
            str = "这是未完成页面";
          });
          break;
        case 1:
          setState(() {
            str = "这是完成页面";
          });
          break;
      }
    });

    _retrieveData();
  }

  String str = "";

  String token = "";

  void getLoginHttp() async {
    try {
      Response response = await Dio().post(
          "http://192.168.21.74:8889/app/rest/auth/login",
          data: {"username": "18400000003", "VCode": "111"});
      token = response.headers.value("x-authorization");
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token);
      return print(response.headers);
    } catch (e) {
      return print(e);
    }
  }

  void getCarRecord() async {
//    return print(token);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String tokens = preferences.get('token');
    debugPrint(tokens);
    Response response = await Dio(BaseOptions(headers: {
      "X-Authorization":
          "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxODQwMDAwMDAwMyIsInV1aWQiOiIxNUEyQjc3OUY2QTQ0N0IxOEU3Q0JEMUQ1MUExMzMxRCIsInNwZWNpYWxVc2VyIjpmYWxzZSwibmlja05hbWUiOiJBcHBsZea4rOippuWToTM0IiwidXNlckhlYWRlciI6ImNhcnBsdXNnby1pbmZvLWltZy8yMDE5LTA4LTI4L2I5ZWNjMGRjNTczMjQzYzQyNzU5MTBjZTYzNTQ0ODNlLmpwZyIsInNjb3BlcyI6WyJST0xFX0FDQ0VTU19UT0tFTiJdLCJpc3MiOiJodHRwOi8vd3d3LnJpaHVpc29mdC5jb20iLCJpYXQiOjE1ODQ1OTgxOTEsImV4cCI6MTU4NDU5ODMxMX0.DdCLWQJSjalOiXVvKX9hXLeJi_EEu4vdRnu_iK0D4rRB55WmKfxmIqbXyqjMYW1dZvNsg9O9AGquKh2q6st9dQ"
    })).post(
        "http://192.168.21.74:8889/app/rest/travel/mobile/getDriverFinishedOrder",
        data: {
          "pageNo": "1",
          "latitude": "30.199415",
          "longitude": "120.27398",
          "locationMode": "1",
          "uid": "-",
          "phoneType": "1",
          "IMEI": "868067034016204",
          "868067034016204": "carplusgo-android-1.0.82"
        });
    return print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    getLoginHttp();
//  getCarRecord();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("乘车记录"),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Text("开发票"),
              alignment: Alignment.center,
            ),
            onTap: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return UseRuleDialogWidget("使用规则", """乘车人数限制：\n
1.车型五人座,出行人数为四人以内(含四人);\n
2.车型七人座,出行人数为六人以内(含六人).\n
乘车行李数限制：\n
1.五人座车,行李数为2-3个(26寸以上的2个,26寸以下3个);\n
2.七人座车,行李数为3-4个(26寸以上3个,26寸以下4个).""");
                  })
            },
          )
        ],
        bottom: TabBar(
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: RefreshIndicator(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (_words[index] == loadingTag) {
                        if (_words.length - 1 < 100) {
                          _retrieveData();
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(16),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "没有更多了",
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }
                      }
                      return CarRecordRow("111", "2", "3");
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: .0,
                        ),
                    itemCount: _words.length),
                onRefresh: _retrieveData),
          );
        }).toList(),
        controller: _tabController,
      ),
    );
  }

  Future _retrieveData() async {
    await Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }
}
