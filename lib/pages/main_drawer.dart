import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tre_flutter/config/router_manger.dart';
import 'package:tre_flutter/pages/test_page.dart';
import 'package:tre_flutter/utils/assets_utils.dart';
import 'package:tre_flutter/utils/navigator_utils.dart';
import 'package:tre_flutter/utils/toast_utils.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainDrawerState();
  }
}

class PageInfo {
  PageInfo(this.titleId, this.iconData, this.page, [this.withScaffold = true]);

  String titleId;
  IconData iconData;
  Widget page;
  bool withScaffold;
}

class _MainDrawerState extends State<MainDrawer> {
  List<PageInfo> _pageInfo = new List();
  String _userName;

  @override
  void initState() {
    super.initState();
    _pageInfo.add(PageInfo("设置", Icons.settings, TestPage()));
    _pageInfo.add(PageInfo("关于", Icons.info, TestPage()));
    _pageInfo.add(PageInfo("注销", Icons.exit_to_app, TestPage()));
  }

  /// 显示注销登录弹窗
  void _showLoginOutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Text(
              "确定退出吗？",
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "取消",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(ctx);
                },
              ),
              FlatButton(
                child: Text(
                  "确认",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
                onPressed: () {
                  ToastUtils.show("退出");
                  Navigator.pop(ctx);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _userName = "Sky24n";

    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(
            height: 166.0,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 20, left: 10.0),
            child: new Stack(
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      width: 64.0,
                      height: 64.0,
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AssetsUtils.getImage('ic_avatar.jpg')),
                        ),
                      ),
                    ),
                    new Text(
                      _userName,
                      style: new TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    new SizedBox(height: 5),
                    new Text(
                      "个人简介",
                      style: new TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
                new Align(
                  alignment: Alignment.topRight,
                  child: new IconButton(iconSize: 18.0, icon: new Icon(Icons.edit, color: Colors.white), onPressed: () {}),
                )
              ],
            ),
          ),
          new Container(
            height: 50.0,
            child: new Material(
              color: Colors.grey[200],
              child: new InkWell(
                onTap: () {
                  NavigatorUtils.jumpByName(context, RouteName.test);
                },
                child: new Center(
                  child: new Text(
                    "Flutter Demos",
                    style: new TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ),
          new Expanded(
            child: new ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: _pageInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  PageInfo pageInfo = _pageInfo[index];
                  return new ListTile(
                    leading: new Icon(pageInfo.iconData),
                    title: Text(pageInfo.titleId),
                    onTap: () {
                      if (pageInfo.titleId == "注销") {
                        _showLoginOutDialog(context);
                      } else if (pageInfo.titleId == "收藏") {
                      } else {
                        NavigatorUtils.jumpByWidget(context, pageInfo.page);
                      }
                    },
                  );
                }),
            flex: 1,
          )
        ],
      ),
    );
  }
}
