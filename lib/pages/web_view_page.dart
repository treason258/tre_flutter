import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String title;
  String url;
  WebViewController _webViewController; // 添加一个controller

  WebViewPage({this.title, this.url});

  @override
  _WebViewPageState createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  String title;

  @override
  void initState() {
    super.initState();
  }

  JavascriptChannel _JsBridge(BuildContext context) => JavascriptChannel(
      name: 'trejsbridge', // h5调用
      onMessageReceived: (JavascriptMessage message) async {
        print(message.message);
      });

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          bottom: false,
          child: WebView(
            initialUrl: widget.url,
            // 加载的url
            userAgent: (Platform.isAndroid ? "Android" : "iOS"),
            // h5 可以通过navigator.userAgent判断当前环境
            javascriptMode: JavascriptMode.unrestricted,
            // 启用 js交互，默认不启用JavascriptMode.disabled
            javascriptChannels: <JavascriptChannel>[
              _JsBridge(context) // 与h5 通信
            ].toSet(),
            onWebViewCreated: (WebViewController web) {
              widget._webViewController = web;
              // webview 创建调用，
              web.loadUrl(widget.url);
            },
            navigationDelegate: (NavigationRequest request) {
              // 在页面跳转之前调用，TODO isForMainFrame为false,页面不跳转.导致网页内很多链接点击没效果
              return NavigationDecision.navigate; // 跳转;
            },
            onPageFinished: (String value) {
              // webview 页面加载调用 flutter 调用h5 端方法
              widget._webViewController.evaluateJavascript('document.title').then((title) {
                // 获取网页h5_title并且设置
                setState(() {
                  this.title = title;
                });
              });
            },
          )),
    );
  }
}
