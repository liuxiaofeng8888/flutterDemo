import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/car_record_list_row.dart';
import 'package:flutter_app/widgets/use_rule_dialog_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  @override
  Widget build(BuildContext context) {
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
          ),onTap: ()=>{
                showDialog(context: context,builder: (context){
                  return UseRuleDialogWidget("使用规则","什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事"
                      "什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传"
                      "什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传"
                      "什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传"
                      "什么事格式上传什么事格式上传什么事格式上传什么事格式上传格式上传什么事格式上传什么事格式上传什么事格式上传什么事格式上传");
                })
          },)
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
