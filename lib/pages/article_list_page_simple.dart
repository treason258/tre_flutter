import 'package:flutter/material.dart';

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
          'Welcome To ArticleListPageSimple',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

/// 打印日志
void log(String msg) {
  print('matengfei | article_list_page_simple.dart | $msg');
}
