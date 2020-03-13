import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tre_flutter/config/router_manger.dart';
import 'package:tre_flutter/pages/article_item_widget.dart';
import 'package:tre_flutter/utils/random_utils.dart';
import 'package:tre_flutter/view_model/article_model.dart';

class ArticleListPage extends StatefulWidget {
  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  List<ArticleModel> mModelList = [];
  bool mIsRequesting = false;
  ScrollController mScrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    log('_HomePageState | initState | mScrollController.addListener');
    mScrollController.addListener(() {
      if (mScrollController.position.pixels == mScrollController.position.maxScrollExtent) {
        log('_HomePageState | initState | mScrollController.position.pixels == mScrollController.position.maxScrollExtent');
        _loadMoreData();
      }
    });

    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        backgroundColor: Colors.blue,
        child: ListView.builder(
          itemCount: mModelList.length + 1,
          itemBuilder: (context, index) {
            if (index == mModelList.length) {
              return _buildProgressIndicator();
            } else {
              ArticleModel item = mModelList[index];
              return ArticleItemWidget(
                item,
                index: index,
                onTap: () async {
                  await Navigator.of(context).pushNamed(RouteName.web_view, arguments: [item.title, item.url]);
                },
              );
            }
          },
          controller: mScrollController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mScrollController.animateTo(0, duration: new Duration(milliseconds: 200), curve: Curves.easeOut);
        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_upward),
      ),
    );
  }

  /// 上拉加载更多转圈动画
  Widget _buildProgressIndicator() {
    log('_HomePageState | _buildProgressIndicator');
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: mIsRequesting ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  /// 下拉刷新数据
  Future<Null> _refreshData() async {
    log('_HomePageState | _refreshData');
    var modelList = await _requestData(RandomUtils.getOrigin());
    setState(() {
      mModelList = modelList;
    });
    return;
  }

  /// 上拉加载数据
  Future<Null> _loadMoreData() async {
    log('_HomePageState | _loadMoreData');
    if (!mIsRequesting) {
      setState(() => mIsRequesting = true);
      List<ArticleModel> modelList;
      if (RandomUtils.getTrueOrFalse()) {
        log('_HomePageState | _requestData | 模拟请求正常数据');
        modelList = await _requestData(RandomUtils.getOrigin());
      } else {
        log('_HomePageState | _requestData | 模拟请求无数据');
        modelList = List();
      }
      if (modelList.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = mScrollController.position.maxScrollExtent - mScrollController.position.pixels;
        if (offsetFromBottom < edge) {
          mScrollController.animateTo(mScrollController.offset - (edge - offsetFromBottom), duration: new Duration(milliseconds: 500), curve: Curves.easeOut);
        }
        showToast("无更多数据");
      }
      setState(() {
        mModelList.addAll(modelList);
        mIsRequesting = false;
      });
    }
    return;
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
