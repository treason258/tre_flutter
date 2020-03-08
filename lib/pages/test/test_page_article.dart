import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tre_flutter/config/router_manger.dart';
import 'package:tre_flutter/pages/article_item_widget.dart';
import 'package:tre_flutter/view_model/article_model.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
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
        title: Text('文章列表'),
      ),
      body: ListView.builder(
        itemCount: dataSource.length,
        itemBuilder: (context, index) {
          ArticleModel item = dataSource[index];
          return ArticleItemWidget(
            item,
            index: index,
            onTap: () async {
              showToast('onItemClick | index = $index');
              await Navigator.of(context).pushNamed(RouteName.article_detail);
            },
          );
        },
      ),
    );
  }

  void requestDataAndReload() async {
    var models = await requestData();
    setState(() {
      dataSource = models;
    });
  }
}

/// 网络请求
Future<List<ArticleModel>> requestData() async {
  // http://api.cportal.cctv.com/api/rest/navListInfo/getHandDataListInfoNew?id=Nav-9Nwml0dIB6wAxgd9EfZA160510&toutuNum=5&version=1&p=5&n=20
  HttpClient network = HttpClient();
  Uri uri = Uri(scheme: 'http', host: 'api.cportal.cctv.com', path: '/api/rest/navListInfo/getHandDataListInfoNew', query: 'id=Nav-9Nwml0dIB6wAxgd9EfZA160510&toutuNum=5&version=1&p=5&n=20');
  HttpClientRequest request = await network.getUrl(uri);
  HttpClientResponse response = await request.close();
  var responseBody = await response.transform(utf8.decoder).join();
  Map dataDict = json.decode(responseBody);
  print('matengfei | responseBody = $responseBody');
  print('matengfei | dataDict = $dataDict');

  List itemList = dataDict['itemList'] as List;
  var models = itemList.map((map) {
    map = map as Map;
    ArticleModel model = ArticleModel.fromDict(map);
    return model;
  }).toList();
  return models;
}
