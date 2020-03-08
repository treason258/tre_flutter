import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class TestPage3 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage3'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _TestItem();
        },
      ),
    );
  }
}

class _TestItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.0,
      child: Column(
        children: <Widget>[
          // 内容视图
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: _cellContentView,
          ),
          // 分割线
          Container(
            margin: EdgeInsets.only(top: 4.0),
            color: Color(0xffeaeaea),
            constraints: BoxConstraints.expand(height: 4.0),
          )
        ],
      ),
    );
  }

  Widget get _cellContentView {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '李志牛逼李志牛逼李志牛逼李志牛逼李志牛逼李志牛逼李志牛逼李志牛逼李志牛逼李志牛逼李志牛逼李志牛逼',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff111111),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                width: 40.0,
                height: 20.0,
                margin: EdgeInsets.only(top: 6.0),
                child: ButtonTheme(
                  buttonColor: Color(0xff1C64CF),
                  shape: StadiumBorder(),
                  child: RaisedButton(
                    onPressed: () {
                      showToast('onTagClick');
                    },
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      '民谣',
                      style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(
          height: 85.0,
          width: 115.0,
          margin: EdgeInsets.only(top: 3.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: AssetImage('images/news_image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
