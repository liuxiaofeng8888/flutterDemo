import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///html页面
class WebViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(text)),
      body: Center(
          child: WebView(
        initialUrl: "https://www.baidu.com/",
      )),
    );
  }

  WebViewWidget({Key key, @required this.text}) : super(key: key);
  String text="";
}
