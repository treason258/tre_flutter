import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tre_flutter/pages/article_detail_page.dart';
import 'package:tre_flutter/pages/splash_page.dart';
import 'package:tre_flutter/pages/tab_navigator.dart';
import 'package:tre_flutter/pages/test/test_page_1.dart';
import 'package:tre_flutter/pages/test/test_page_2.dart';
import 'package:tre_flutter/pages/test/test_page_3.dart';
import 'package:tre_flutter/pages/test/test_page_4.dart';
import 'package:tre_flutter/pages/test/test_page_5.dart';
import 'package:tre_flutter/pages/test_page.dart';
import 'package:tre_flutter/widgets/page_route_anim.dart';

class RouteName {
  // TEST
  static const String test0 = 'test0';
  static const String test1 = 'test1';
  static const String test2 = 'test2';
  static const String test3 = 'test3';
  static const String test4 = 'test4';
  static const String test5 = 'test5';

  // RouteName
  static const String splash = 'splash';
  static const String tab = '/';
  static const String article_detail = 'article_detail';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // TEST
      case RouteName.test0:
        return NoAnimRouteBuilder(TestPage());
      case RouteName.test1:
        return NoAnimRouteBuilder(TestPage1());
      case RouteName.test2:
        return NoAnimRouteBuilder(TestPage2());
      case RouteName.test3:
        return NoAnimRouteBuilder(TestPage3());
      case RouteName.test4:
        return NoAnimRouteBuilder(TestPage4());
      case RouteName.test5:
        return NoAnimRouteBuilder(TestPage5());
      // RouteName
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashPage());
      case RouteName.tab:
        return NoAnimRouteBuilder(TabNavigator());
      case RouteName.article_detail:
        return NoAnimRouteBuilder(ArticleDetailPage());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

/// Pop路由
class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
