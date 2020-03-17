import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/article_detail_page.dart';
import 'package:tre_flutter/pages/splash_page.dart';
import 'package:tre_flutter/pages/tab_navigator.dart';
import 'package:tre_flutter/pages/test_page.dart';
import 'package:tre_flutter/pages/web_view_page.dart';
import 'package:tre_flutter/utils/navigator_utils.dart';

class RouteName {
  static const String test0 = 'test0';
  static const String splash = 'splash';
  static const String tab = 'tab';
  static const String article_detail = 'article_detail';
  static const String web_view = 'web_view';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.test0:
        return NavigatorUtils.getCupertinoPageRoute(TestPage());
      case RouteName.splash:
        return NavigatorUtils.getNoAnimRoute(SplashPage());
      case RouteName.tab:
        return NavigatorUtils.getNoAnimRoute(TabNavigator());
      case RouteName.article_detail:
        return NavigatorUtils.getCupertinoPageRoute(ArticleDetailPage());
      case RouteName.web_view:
        var list = settings.arguments as List;
        String title = list[0];
        String url = list[1];
        return NavigatorUtils.getCupertinoPageRoute(WebViewPage(title: title, url: url));
      default:
        return CupertinoPageRoute(
          builder: (ctx) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
