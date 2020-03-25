import 'dart:isolate';

import 'package:flutter/material.dart';

///isolate例子
class IsolateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IsolateWidgetState();
  }
}

///隔离组件的状态
class IsolateWidgetState extends State with WidgetsBindingObserver {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Isolate测试"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
            FlatButton(
                onPressed: () async {
//                  _count = await countEvent(1000000000);
//                  _count = await compute(countEvent, 1000000000);
                  _count = await isolateCountEvent(1000000000);
                  setState(() {});
                },
                child: Text(_count.toString()))
          ],
        ),
      ),
    );
  }

  //计算偶数的个数
  static Future<int> countEvent(int num) async {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  static Future<dynamic> isolateCountEvent(int num) async {
    final response = ReceivePort();
    await Isolate.spawn(countEvent2, response.sendPort);
    final sendPort = await response.first;
    final anwser = ReceivePort();
    sendPort.send([anwser.sendPort, num]);
    return anwser.first;
  }

  static void countEvent2(SendPort sendPort) {
    final port = ReceivePort();
    sendPort.send(port.sendPort);
    port.listen((message) {
      final send = message[0] as SendPort;
      final n = message[1] as int;
      send.send(countEvent(n));
    });
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      print("went to Background");
    }

    if(state == AppLifecycleState.resumed){
      print("came back to Foreground");
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
