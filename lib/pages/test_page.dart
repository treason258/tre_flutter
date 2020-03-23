import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/test/test_page_1.dart';
import 'package:tre_flutter/pages/test/test_page_2.dart';
import 'package:tre_flutter/pages/test/test_page_3.dart';
import 'package:tre_flutter/pages/test/test_page_4.dart';
import 'package:tre_flutter/pages/test/test_page_4a.dart';
import 'package:tre_flutter/pages/test/test_page_5.dart';
import 'package:tre_flutter/pages/test/test_page_99.dart';
import 'package:tre_flutter/utils/navigator_utils.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //动态创建一个List<Widget>
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("---------------- NewPage ----------------"),
                    onPressed: () {
                      NavigatorUtils.jumpToNewPage(context, "NewPage", "Welcome to NewPage");
                    },
                  ),
                ),
              ]),
              buildItemWidget("TestPage1-自带计数器示例", TestPage1()),
              buildItemWidget("TestPage2-展示时间", TestPage2()),
              buildItemWidget("TestPage3-列表", TestPage3()),
              buildItemWidget("TestPage4-轮播图", TestPage4()),
              buildItemWidget("TestPage4a-轮播图", TestPage4a()),
              buildItemWidget("TestPage5-闪屏页动画", TestPage5()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
              buildItemWidget("TestPage99", TestPage99()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemWidget(String text, Widget widget) {
    return Row(children: <Widget>[Expanded(child: RaisedButton(child: Text(text), onPressed: () => NavigatorUtils.jumpByWidget(context, widget)))]);
  }
}
