import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebViewPage extends StatefulWidget {
  final String tilte;
  final String url;

  WebViewPage({Key key, @required this.tilte,@required this.url}) : super(key: key);

  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  // completer 异步手动控制
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // 双击返回与界面退出提示
        return WillPopScope(
          onWillPop: () async {
            if (snapshot.hasData) {
              bool canGoBack = await snapshot.data.canGoBack();
              if (canGoBack) {
                // 网页可以返回时，优先返回上一页
                snapshot.data.goBack();
                return Future.value(false);
              }
              return Future.value(true);
            }
            return Future.value(true);
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.tilte),
            ),
            body: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController){
                _controller.complete(webViewController);
              },
            ),
          ),
        );
      },
    );
  }
}