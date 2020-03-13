import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tre_flutter/generated/i18n.dart';
import 'package:tre_flutter/pages/home_page.dart';
import 'package:tre_flutter/pages/news_page.dart';
import 'package:tre_flutter/pages/test_page.dart';
import 'package:tre_flutter/pages/user_page.dart';

List<Widget> pages = <Widget>[HomePage(), NewsPage(), UserPage(), TestPage()];

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null || DateTime.now().difference(_lastPressed) > Duration(seconds: 1)) {
            // 两次点击间隔超过1秒则重新计时
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(S.of(context).tabHome),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text("新闻"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("我的"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error),
            title: Text("TEST"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  @override
  void initState() {
//    checkAppUpdate(context);
    super.initState();
  }
}
