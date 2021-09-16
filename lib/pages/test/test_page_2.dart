import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tre_flutter/utils/toast_utils.dart';

class TestPage2 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage2> {
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage2'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          '当前时间：$timestamp',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshTimeAndShow,
        tooltip: 'refresh',
        child: Icon(Icons.refresh),
      ), // This trailing co
    );
  }

  void refreshTimeAndShow() {
    int timestampNew = DateTime.now().millisecondsSinceEpoch;
    setState(() {
      timestamp = timestampNew;
    });
    ToastUtils.show("当前时间：" + timestampNew.toString());
  }
}
