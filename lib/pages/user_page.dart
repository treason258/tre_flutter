import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/test/test_page_1.dart';
import 'package:tre_flutter/pages/test_page.dart';
import 'package:tre_flutter/utils/assets_utils.dart';
import 'package:tre_flutter/utils/color_utils.dart';
import 'package:tre_flutter/utils/navigator_utils.dart';
import 'package:tre_flutter/utils/toast_utils.dart';
import 'package:tre_flutter/utils/widget_utils.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<MenuInfo> mMenuList = new List();

  @override
  void initState() {
    super.initState();
    mMenuList.add(MenuInfo("设置", Icons.settings, null));
    mMenuList.add(MenuInfo("关于", Icons.info, null));
    mMenuList.add(MenuInfo("注销", Icons.exit_to_app, null));
    mMenuList.add(MenuInfo("TestPage", Icons.warning, TestPage()));
    mMenuList.add(MenuInfo("TEST1", Icons.warning, TestPage1()));
    mMenuList.add(MenuInfo("TEST2", Icons.warning, TestPage1()));
    mMenuList.add(MenuInfo("TEST3", Icons.warning, TestPage1()));
    mMenuList.add(MenuInfo("TEST4", Icons.warning, TestPage1()));
    mMenuList.add(MenuInfo("TEST5", Icons.warning, TestPage1()));
    mMenuList.add(MenuInfo("TEST6", Icons.warning, TestPage1()));
    mMenuList.add(MenuInfo("TEST7", Icons.warning, TestPage1()));
    mMenuList.add(MenuInfo("TEST8", Icons.warning, TestPage1()));
    mMenuList.add(MenuInfo("TEST9", Icons.warning, TestPage1()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 标题栏，28+56=84
        WidgetUtils.buildStatusBar(),
        WidgetUtils.buildTitleBar(),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 180,
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  padding: EdgeInsets.only(top: 0, left: 0),
                  width: double.infinity,
                  color: Colors.lightBlue,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 70,
                              height: 70,
                              margin: EdgeInsets.only(top: 0, bottom: 0),
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(AssetsUtils.getImage('ic_avatar.jpg'))),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("青春不再", style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text("好好学习，天天向上！", style: TextStyle(color: Colors.white, fontSize: 12.0)),
                          ],
                        ),
                      ),
                      new Align(
                        alignment: Alignment.topRight,
                        child: new IconButton(iconSize: 22, icon: new Icon(Icons.edit, color: Colors.white), onPressed: () => ToastUtils.show("Icons.edit")),
                      )
                    ],
                  ),
                ),
                WidgetUtils.buildLine(lineHeight: 10, lineColor: ColorUtils.ffeeeeee),
                Container(
                  height: 50.0,
                  child: Material(
                    color: Colors.red,
                    child: InkWell(
                      child: Center(child: Text("TEST", style: new TextStyle(color: Colors.white, fontSize: 16.0))),
                      onTap: () => NavigatorUtils.jumpByWidget(context, TestPage()),
                    ),
                  ),
                ),
                WidgetUtils.buildLine(lineHeight: 10, lineColor: ColorUtils.ffeeeeee),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(0.0),
                    itemCount: mMenuList.length,
                    itemBuilder: (BuildContext context, int index) {
                      MenuInfo menuInfo = mMenuList[index];
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(menuInfo.icon),
                            title: Text(menuInfo.title),
                            onTap: () {
                              if (menuInfo.title == "设置") {
                                NavigatorUtils.jumpToNewPage(context, "设置", "设置页面");
                              } else if (menuInfo.title == "关于") {
                                NavigatorUtils.jumpToNewPage(context, "关于", "关于页面");
                              } else if (menuInfo.title == "注销") {
                                showLoginOutDialog(context);
                              } else {
                                NavigatorUtils.jumpByWidget(context, menuInfo.page);
                              }
                            },
                          ),
                          WidgetUtils.buildLine(lineHeight: 1, lineColor: ColorUtils.ffeeeeee),
                        ],
                      );
                    }),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MenuInfo {
  String title;
  IconData icon;
  Widget page;

  MenuInfo(this.title, this.icon, this.page);
}

/// 显示注销登录弹窗
void showLoginOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text("提示", style: TextStyle(fontSize: 16, color: Colors.black)),
        content: Text("确定要退出登录吗？", style: TextStyle(fontSize: 16, color: Colors.black)),
        actions: <Widget>[
          FlatButton(
            child: Text("取消", style: TextStyle(fontSize: 14, color: Colors.black)),
            onPressed: () {
              Navigator.pop(ctx);
            },
          ),
          FlatButton(
            child: Text("确认", style: TextStyle(fontSize: 14, color: Colors.black)),
            onPressed: () {
              ToastUtils.show("退出");
              Navigator.pop(ctx);
              // Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
