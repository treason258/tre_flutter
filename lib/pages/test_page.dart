import 'package:flutter/material.dart';
import 'package:tre_flutter/config/router_manger.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello Wolrd!',
            ),
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
