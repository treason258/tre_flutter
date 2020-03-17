import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/article_detail_page.dart';
import 'package:tre_flutter/pages/splash_page.dart';
import 'package:tre_flutter/pages/main_page.dart';
import 'package:tre_flutter/pages/test_page.dart';
import 'package:tre_flutter/pages/web_page.dart';
import 'package:tre_flutter/utils/navigator_utils.dart';

class RouteName {
  static const String test = 'test';
  static const String splash = 'splash';
  static const String main = 'main';
  static const String web = 'web';
  static const String article_detail = 'article_detail';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.test:
        return NavigatorUtils.getCupertinoPageRoute(TestPage());
      case RouteName.splash:
        return NavigatorUtils.getNoAnimRoute(SplashPage());
      case RouteName.main:
        return NavigatorUtils.getNoAnimRoute(MainPage());
      case RouteName.web:
        var list = settings.arguments as List;
        String title = list[0];
        String url = list[1];
        return NavigatorUtils.getCupertinoPageRoute(WebPage(title: title, url: url));
      case RouteName.article_detail:
        return NavigatorUtils.getCupertinoPageRoute(ArticleDetailPage());
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
