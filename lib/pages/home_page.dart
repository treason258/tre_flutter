import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tre_flutter/config/router_manger.dart';
import 'package:tre_flutter/pages/article_item_widget.dart';
import 'package:tre_flutter/view_model/article_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleModel> dataSource = [];

  @override
  void initState() {
    super.initState();
    requestDataAndReload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        backgroundColor: Colors.blue,
        child: ListView.builder(
          itemCount: dataSource.length,
          itemBuilder: (context, index) {
            ArticleModel item = dataSource[index];
            return ArticleItemWidget(
              item,
              index: index,
              onTap: () async {
                await Navigator.of(context).pushNamed(RouteName.web_view, arguments: [item.title, item.url]);
              },
            );
          },
        ),
      ),
    );
  }

  void requestDataAndReload() async {
    int origin = ArticleModel.ORIGIN_CCTV;
    int next = Random().nextInt(10);
    print('matengfei | home_page.dart | requestDataAndReload | next = $next');
    switch (next % 3) {
      case 0:
        origin = ArticleModel.ORIGIN_CCTV;
        break;
      case 1:
        origin = ArticleModel.ORIGIN_JUHE_TOUTIAO;
        break;
      case 2:
        origin = ArticleModel.ORIGIN_JUHE_WEIXIN;
        break;
    }
    var models = await requestData(origin);
    setState(() {
      dataSource = models;
    });
  }

  Future<Null> _refresh() async {
    requestDataAndReload();
    return;
  }
}

/// 网络请求
Future<List<ArticleModel>> requestData(int origin) async {
  print('matengfei | home_page.dart | requestData | origin = $origin');
  Uri uri = ArticleModel.getUri(origin);

  HttpClient network = HttpClient();
  HttpClientRequest request = await network.getUrl(uri);
  HttpClientResponse response = await request.close();

  var responseBody = await response.transform(utf8.decoder).join();
  print('matengfei | home_page.dart | requestData | responseBody = $responseBody');
  Map responseData = json.decode(responseBody);
  print('matengfei | home_page.dart | requestData | responseData = $responseData');

  return ArticleModel.parseList(responseData, origin);
}
