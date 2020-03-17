import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tre_flutter/config/router_manger.dart';
import 'package:tre_flutter/pages/test/test_page_3.dart';

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
            RaisedButton(child: Text("TestPage1"), onPressed: () => Navigator.of(context).pushNamed(RouteName.test1)),
            RaisedButton(child: Text("TestPage2"), onPressed: () => Navigator.of(context).pushNamed(RouteName.test2)),
            RaisedButton(
                child: Text("TestPage3"),
                onPressed: () {
//                Navigator.pushNamed(context, RouteName.test3);
//                Navigator.of(context).pushNamed(RouteName.test2);
                  Navigator.push(context, new CupertinoPageRoute<void>(builder: (ctx) => TestPage3()));
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pushNamed,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void pushNamed() {
    Navigator.of(context).pushNamed(RouteName.test5);
  }
}
