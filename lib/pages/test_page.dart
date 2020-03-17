import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/test/test_page_1.dart';
import 'package:tre_flutter/pages/test/test_page_2.dart';
import 'package:tre_flutter/pages/test/test_page_3.dart';
import 'package:tre_flutter/pages/test/test_page_4.dart';
import 'package:tre_flutter/pages/test/test_page_5.dart';
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(child: Text("TestPage1"), onPressed: () => NavigatorUtils.jumpByWidget(context, TestPage1())),
            RaisedButton(child: Text("TestPage2"), onPressed: () => NavigatorUtils.jumpByWidget(context, TestPage2())),
            RaisedButton(child: Text("TestPage3"), onPressed: () => NavigatorUtils.jumpByWidget(context, TestPage3())),
            RaisedButton(child: Text("TestPage4"), onPressed: () => NavigatorUtils.jumpByWidget(context, TestPage4())),
            RaisedButton(child: Text("TestPage5"), onPressed: () => NavigatorUtils.jumpByWidget(context, TestPage5())),
          ],
        ),
      ),
    );
  }
}
