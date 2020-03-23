import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/article_list_page.dart';
import 'package:tre_flutter/pages/home_banner.dart';
import 'package:tre_flutter/utils/log_utils.dart';
import 'package:tre_flutter/utils/widget_utils.dart';

class HomePage extends StatefulWidget {
  HomePage() {
    log('HomePage | HomePage');
  }

  @override
  StatefulElement createElement() {
    log('HomePage | createElement');
    return super.createElement();
  }

  @override
  _HomePageState createState() {
    log('HomePage | createState');
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    log('_HomePageState | initState');
    super.initState();
    log('_HomePageState | initState | mScrollController.addListener');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log('_HomePageState | didChangeDependencies');
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    log('_HomePageState | didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    log('_HomePageState | deactivate');
  }

  @override
  void dispose() {
    log('_HomePageState | dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('_HomePageState | build');
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('首页')),
      ),
      body: ArticleListPage(
        headerCreator: getHeaderWidget,
        footerCreator: getFooterWidget,
        footer2: WidgetUtils.buildTextWidget("Footer2 From HomePage | 333"),
      ),
    );
  }

  Widget getHeaderWidget(BuildContext context, int index) {
    return Container(
        child: Column(
      children: <Widget>[
        HomeBanner(),
        buildHomeMenu(),
      ],
    ));
  }

  Widget getFooterWidget(BuildContext context, int index) {
    return WidgetUtils.buildTextWidget("Footer From HomePage | 333 | index = $index");
  }

  Widget buildHomeMenu() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 横轴元素个数
        crossAxisSpacing: 10.0, // 横轴间距
        mainAxisSpacing: 10.0, // 纵轴间距
        childAspectRatio: 2.0, // 子组件宽高长度比例
      ),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          onTap: () {},
          child: WidgetUtils.buildTextWidget("菜单$index"),
        );
      },
    );
  }
}

/// 打印日志
void log(String msg) {
  LogUtils.printLog('matengfei | home_page.dart | $msg');
}
