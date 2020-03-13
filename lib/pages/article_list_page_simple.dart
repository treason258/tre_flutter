import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tre_flutter/view_model/article_model.dart';

class ArticleListPageSimple extends StatefulWidget {
  @override
  _ArticleListPageSimpleState createState() => _ArticleListPageSimpleState();
}

class _ArticleListPageSimpleState extends State<ArticleListPageSimple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          'Welcome To ArticleListPage',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

/// 网络请求
Future<List<ArticleModel>> _requestData(int origin) async {
  log('_HomePageState | _requestData | origin = $origin');
  Uri uri = ArticleModel.getUri(origin);

  HttpClient network = HttpClient();
  HttpClientRequest request = await network.getUrl(uri);
  HttpClientResponse response = await request.close();

  var responseBody = await response.transform(utf8.decoder).join();
  Map responseData = json.decode(responseBody);
  log('_HomePageState | _requestData | responseData = $responseData');

  return ArticleModel.parseList(responseData, origin);
}

/// 打印日志
void log(String msg) {
  print('matengfei | article_list_page.dart | $msg');
}
