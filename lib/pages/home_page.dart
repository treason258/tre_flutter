import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/article_list_page.dart';
import 'package:tre_flutter/utils/log_utils.dart';

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
        title: Text('首页'),
      ),
      body: ArticleListPage(),
    );
  }
}

/// 打印日志
void log(String msg) {
  LogUtils.printLog('matengfei | home_page.dart | $msg');
}
