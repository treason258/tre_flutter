import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/uxin/xin_list_page.dart';

class TestPage7 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage7'),
      ),
      body: XinListPage(),
    );
  }
}
