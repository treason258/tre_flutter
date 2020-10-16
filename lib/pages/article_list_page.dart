import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tre_flutter/config/router_manger.dart';
import 'package:tre_flutter/pages/article_item_widget.dart';
import 'package:tre_flutter/utils/log_utils.dart';
import 'package:tre_flutter/utils/navigator_utils.dart';
import 'package:tre_flutter/utils/random_utils.dart';
import 'package:tre_flutter/utils/toast_utils.dart';
import 'package:tre_flutter/utils/widget_utils.dart';
import 'package:tre_flutter/view_model/article_model.dart';

typedef HeaderWidgetBuild = Widget Function(BuildContext context, int index);
typedef FooterWidgetBuild = Widget Function(BuildContext context, int index);

class ArticleListPage extends StatefulWidget {
  HeaderWidgetBuild headerCreator;
  FooterWidgetBuild footerCreator;
  Widget footer2;

  ArticleListPage({Key key, this.headerCreator, this.footerCreator, this.footer2}) : super(key: key);

  @override
  _ArticleListPageState createState() => _ArticleListPageState(footer2: footer2);
}

class _ArticleListPageState extends State<ArticleListPage> {
  List<ArticleModel> mModelList = [];
  bool mIsRequesting = false;
  ScrollController mScrollController = new ScrollController();
  Widget footer2;

  int itemModelCount = 0;
  int itemHeaderCount = 1;
  int itemFooterCount = 1;
  int itemFooter2Count = 1;
  int itemLoadMoreCount = 1;

  _ArticleListPageState({this.footer2});

  @override
  void initState() {
    super.initState();
    log('_ArticleListPageState | initState | mScrollController.addListener');
    mScrollController.addListener(() {
      if (mScrollController.position.pixels == mScrollController.position.maxScrollExtent) {
        log('_ArticleListPageState | initState | mScrollController.position.pixels == mScrollController.position.maxScrollExtent');
        _loadMoreData();
      }
    });

    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    itemModelCount = mModelList.length;
    log("_ArticleListPageState | build | itemModelCount = " + itemModelCount.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        backgroundColor: Colors.blue,
        child: ListView.builder(
          // 假设itemModelCount=10，则共需要14个位置用于展示
          // 0-header; 1~10-model; 11-footer; 12-footer2; 13-loadMore
          // 所以modelItem真实index需要减掉1
          itemCount: itemModelCount + itemHeaderCount + itemFooterCount + itemFooter2Count + itemLoadMoreCount,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _headerItemWidget(context, index); // 0-header
            } else if (index == itemModelCount + itemHeaderCount) {
              return _footerItemWidget(context, index); // 11-footer
            } else if (index == itemModelCount + itemHeaderCount + itemFooterCount) {
              return _footer2ItemWidget(); // 12-footer2
            } else if (index == itemModelCount + itemHeaderCount + itemFooterCount + itemFooter2Count) {
              return _buildProgressIndicator(); // 13-loadMore
            } else {
              // 1~10-model
              int indexReal = index - itemHeaderCount;
              ArticleModel item = mModelList[indexReal];
              return ArticleItemWidget(
                item,
                index: index,
                indexReal: indexReal,
                onTap: () async {
                  await NavigatorUtils.jumpByName(context, RouteName.web, arguments: [item.title, item.url]);
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
    log('_ArticleListPageState | _buildProgressIndicator');
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0, // mIsRequesting ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  /// 下拉刷新数据
  Future<Null> _refreshData() async {
    log('_ArticleListPageState | _refreshData');
    var modelList = await _requestData(RandomUtils.getOrigin());
    setState(() {
      mModelList = modelList;
    });
    return;
  }

  /// 上拉加载数据
  Future<Null> _loadMoreData() async {
    log('_ArticleListPageState | _loadMoreData');
    if (!mIsRequesting) {
      setState(() => mIsRequesting = true);
      List<ArticleModel> modelList;
      if (RandomUtils.getTrueOrFalse()) {
        log('_ArticleListPageState | _requestData | 模拟请求正常数据');
        modelList = await _requestData(RandomUtils.getOrigin());
      } else {
        log('_ArticleListPageState | _requestData | 模拟请求无数据');
        modelList = List();
      }
      if (modelList.isEmpty) {
        double edge = 50.0;
        double offsetFromBottom = mScrollController.position.maxScrollExtent - mScrollController.position.pixels;
        if (offsetFromBottom < edge) {
          mScrollController.animateTo(mScrollController.offset - (edge - offsetFromBottom), duration: new Duration(milliseconds: 500), curve: Curves.easeOut);
        }
        ToastUtils.show("无更多数据");
      }
      setState(() {
        mModelList.addAll(modelList);
        mIsRequesting = false;
      });
    }
    return;
  }

  Widget _headerItemWidget(BuildContext context, int index) {
    if (widget.headerCreator != null) {
      return widget.headerCreator(context, index);
    } else {
      return WidgetUtils.buildNullWidget();
    }
  }

  Widget _footerItemWidget(BuildContext context, int index) {
    if (widget.footerCreator != null) {
      return widget.footerCreator(context, index);
    } else {
      return WidgetUtils.buildNullWidget();
    }
  }

  Widget _footer2ItemWidget() {
    if (footer2 != null) {
      return footer2;
    } else {
      return WidgetUtils.buildNullWidget();
    }
  }
}

/// 网络请求
Future<List<ArticleModel>> _requestData(int origin) async {
  log('_ArticleListPageState | _requestData | origin = $origin');
  Uri uri = ArticleModel.getUri(origin);

  HttpClient network = HttpClient();
  HttpClientRequest request = await network.getUrl(uri);
  HttpClientResponse response = await request.close();

  try {
    var responseBody = await response.transform(utf8.decoder).join();
    Map responseData = json.decode(responseBody);
    log('_ArticleListPageState | _requestData | responseData = $responseData');
    return ArticleModel.parseList(responseData, origin);
  } catch (e) {
    ToastUtils.show("网络请求失败");
    log('_ArticleListPageState | _requestData | e.toString() = ' + e.toString());
    return new List();
  }
}

/// 打印日志
void log(String msg) {
  LogUtils.printLog('matengfei | article_list_page.dart | $msg');
}
