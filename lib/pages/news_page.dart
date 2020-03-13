import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/article_list_page.dart';

import 'article_list_page_simple.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with SingleTickerProviderStateMixin {
  var mTabController;
  var mTabList = <Tab>[
    Tab(text: "测试测试1"),
    Tab(text: "测试测试2"),
    Tab(text: "测试测试3"),
    Tab(text: "测试测试4"),
    Tab(text: "测试测试5"),
    Tab(text: "测试测试6"),
    Tab(text: "测试测试7"),
    Tab(text: "测试测试8"),
  ];

  @override
  void initState() {
    super.initState();
    mTabController = TabController(
      length: mTabList.length,
      vsync: this, //动画效果的异步处理，默认格式，背下来即可
    );
  }

  @override
  void dispose() {
    mTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          tabs: mTabList,
          controller: mTabController,
          //配置控制器
          isScrollable: true,
          indicatorColor: Color(0xffffffff),
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.only(bottom: 6.0),
          labelPadding: EdgeInsets.only(left: 10, right: 10),
          labelColor: Color(0xffffffff),
          labelStyle: TextStyle(fontSize: 15.0),
          unselectedLabelColor: Color(0x88ffffff),
          unselectedLabelStyle: TextStyle(fontSize: 12.0),
        ),
      ),
      body: TabBarView(
          controller: mTabController, //配置控制器
          children: mTabList
              .map((Tab tab) => Container(
                    child: Center(
                      child: ArticleListPage(),
                    ),
                  ))
              .toList()),
    );
  }
}
