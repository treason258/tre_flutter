import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String title;
  String url;

  WebViewPage({this.title, this.url}) {
    log('WebViewPage | WebViewPage');
  }

  @override
  StatefulElement createElement() {
    log('WebViewPage | createElement');
    return super.createElement();
  }

  @override
  _WebViewPageState createState() {
    log('WebViewPage | createState');
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  String title;
  WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    log('_WebViewPageState | initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log('_WebViewPageState | didChangeDependencies');
  }

  @override
  void didUpdateWidget(WebViewPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    log('_WebViewPageState | didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    log('_WebViewPageState | deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    log('_WebViewPageState | dispose');
  }

  @override
  Widget build(BuildContext context) {
    log('_WebViewPageState | build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          bottom: false,
          child: WebView(
            // 需要加载的url
            initialUrl: widget.url,
            // H5可以通过navigator.userAgent判断当前环境
            userAgent: (Platform.isAndroid ? "Android" : "iOS"),
            // 启用JS交互，默认不启用JavascriptMode.disabled
            javascriptMode: JavascriptMode.unrestricted,

            // WebView创建完成
            onWebViewCreated: (WebViewController controller) {
              log('_WebViewPageState | build | WebView | onWebViewCreated');
              webViewController = controller;
            },

            // 页面加载开始
            onPageStarted: (String url) {
              log('_WebViewPageState | build | WebView | onPageStarted | url = $url');
            },

            // 页面加载完成
            onPageFinished: (String url) {
              log('_WebViewPageState | build | WebView | onPageFinished | url = $url');
              webViewController.evaluateJavascript('document.title').then((title) {
                // 获取网页H5的title并且更新
                setState(() {
                  this.title = title;
                });
              });
            },

            // 拦截请求
            navigationDelegate: (NavigationRequest request) {
              log('_WebViewPageState | build | WebView | navigationDelegate | url = ${request.url}');
              return NavigationDecision.navigate;
            },

            // 与H5通信
            javascriptChannels: <JavascriptChannel>[
              JavascriptChannel(
                  name: "trejsbridge",
                  onMessageReceived: (JavascriptMessage message) {
                    log("_WebViewPageState | build | WebView | javascriptChannels | message = ${message.message}");
                  }),
            ].toSet(),
          )),
    );
  }
}

void log(String msg) {
  print('matengfei | web_view_page.dart | $msg');
}
