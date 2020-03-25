import 'package:flutter/material.dart';
import 'package:tre_flutter/utils/assets_utils.dart';
import 'package:tre_flutter/utils/toast_utils.dart';
import 'package:tre_flutter/utils/widget_utils.dart';

class TestPage6 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage6'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        color: Colors.teal,
        child: buildStudyWidget(),
      ),
    );
  }

  /// 学习
  Widget buildStudyWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          WidgetUtils.buildLine(),
          Container(
            color: Colors.red,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
            constraints: BoxConstraints.expand(height: 100, width: double.infinity),
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        "LINE111",
                        style: TextStyle(
                          backgroundColor: Colors.yellow,
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () => ToastUtils.show("LINE111"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          WidgetUtils.buildLine(),
          Row(
            children: <Widget>[
              WidgetUtils.buildLineVertical(),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.green, Colors.yellow, Colors.blue],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      tileMode: TileMode.repeated,
                      stops: [0.2, 0.3, 0.5, 0.8],
                    ),
                  ),
                  child: FlutterLogo(
                    size: 150.0,
                  ),
                ),
              ),
              WidgetUtils.buildLineVertical(),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: RadialGradient(
                      colors: [Colors.red, Colors.green, Colors.yellow, Colors.pink],
                      center: Alignment(-0.6, -0.6),
                      radius: 0.2,
                      tileMode: TileMode.clamp,
                      stops: [0.2, 0.3, 0.5, 0.8],
                    ),
                  ),
                  child: FlutterLogo(
                    size: 150.0,
                  ),
                ),
              ),
              WidgetUtils.buildLineVertical(),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: RadialGradient(
                      colors: [Colors.red, Colors.green, Colors.yellow, Colors.purple],
                      center: Alignment(0, 0),
                      radius: 0.2,
                      tileMode: TileMode.clamp,
                      stops: [0.3, 0.5, 0.6, 0.7],
                    ),
                  ),
                  child: FlutterLogo(
                    size: 150.0,
                  ),
                ),
              ),
              WidgetUtils.buildLineVertical(),
            ],
          ),
          WidgetUtils.buildLine(),
          Row(
            children: <Widget>[
              WidgetUtils.buildLineVertical(),
              Container(
                width: 150.0,
                height: 150.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(image: AssetImage(AssetsUtils.getImage("news_image.png")), fit: BoxFit.cover),
                    border: Border.all(color: Colors.green, width: 5.0, style: BorderStyle.solid),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                  ),
                  child: FlutterLogo(size: 200.0),
                ),
              ),
              WidgetUtils.buildLineVertical(),
              WidgetUtils.buildLineVertical(),
              WidgetUtils.buildLineVertical(),
              Container(
                width: 150.0,
                height: 150.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage(AssetsUtils.getImage("news_image.png")),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                      colorFilter: ColorFilter.mode(Colors.brown.withOpacity(0.8), BlendMode.color),
                    ),
                    border: Border.all(color: Colors.green, width: 5.0, style: BorderStyle.solid),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(20, 60),
                      topRight: Radius.elliptical(20, 60),
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                      ),
                    ],
                  ),
                  child: FlutterLogo(size: 200.0),
                ),
              ),
              WidgetUtils.buildLineVertical(),
            ],
          ),
          WidgetUtils.buildLine(),
          Container(
            color: Colors.yellow,
            height: 20,
            margin: EdgeInsets.only(top: 0, bottom: 0),
            constraints: BoxConstraints.expand(height: 50, width: 60),
            child: Text("LINE3"),
          ),
          WidgetUtils.buildLine(),
        ],
      ),
    );
  }
}
