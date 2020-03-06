import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome To UserPage',
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              '当前时间：$timestamp',
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refresh,
        tooltip: 'refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-forma
    );
  }

  void refresh() {
    int timestampNew = DateTime.now().millisecondsSinceEpoch;
    showToast("当前时间：" + timestampNew.toString(), context: context);
    setState(() {
      timestamp = timestampNew;
    });
  }
}
