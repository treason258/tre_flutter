import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tre_flutter/widgets/page_route_anim.dart';

/// 跳转工具
class NavigatorUtils {
  /**************** 页面跳转 ****************/

  /// 页面跳转：根据 routeName
  static Future<void> jumpByName(BuildContext context, String routeName, {Object arguments, bool replacement: false}) async {
    if (replacement) {
      Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
    } else {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    }
  }

  /// 页面跳转：根据 route
  static Future<void> jumpByRoute(BuildContext context, Route route, {bool replacement: false}) async {
    if (replacement) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }

  /// 页面跳转：根据 widget
  static Future<void> jumpByWidget(BuildContext context, Widget widget, {bool replacement: false}) async {
    jumpByRoute(context, getCupertinoPageRoute(widget), replacement: replacement);
  }

  /// 页面跳转：跳转到新页面
  static Future<void> jumpToNewPage(BuildContext context, String title, String content) async {
    Route route = CupertinoPageRoute(
      builder: (ctx) => Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(
            content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
    jumpByRoute(context, route);
  }

  /**************** 页面进入效果 ****************/

  /// 页面进入效果：从右向左
  static Route getCupertinoPageRoute(Widget widget) {
    return CupertinoPageRoute<void>(builder: (ctx) => widget);
  }

  /// 页面进入效果：从下向上
  static Route getMaterialPageRoute(Widget widget) {
    return MaterialPageRoute<void>(builder: (ctx) => widget);
  }

  /// 页面进入效果：不带任何效果
  static Route getNoAnimRoute(Widget widget) {
    return NoAnimRouteBuilder(widget);
  }

  /// 页面进入效果：从上而下
  static Route getSlideTopRoute(Widget widget) {
    return SlideTopRouteBuilder(widget);
  }

  /// 页面进入效果：渐渐出现
  static Route getFadeRoute(Widget widget) {
    return FadeRouteBuilder(widget);
  }

  /// 页面进入效果：中间位置从小放大
  static Route getSizeRoute(Widget widget) {
    return SizeRoute(widget);
  }

  /// 页面进入效果：无
  static Route getPopRoute(Widget widget) {
    return PopRoute(child: widget);
  }
}
