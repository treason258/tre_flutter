import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tre_flutter/utils/assets_utils.dart';
import 'package:tre_flutter/utils/toast_utils.dart';

class WidgetUtils {
  /// 返回空的控件，用于占位
  static Widget buildNullWidget() {
    return Container();
  }

  /// 中间显示文本可点击的控件
  static Widget buildTextWidget(
    String text, {
    double textSize: 15,
    Color textColor: Colors.white,
    Color backgroundColor: Colors.green,
    double backgroundHeight: 80,
    String onTapText: "onTapText",
    String onDoubleTapText: "onDoubleTapText",
    String onLongPressText: "onLongPressText",
    Function onTapFun,
    Function onDoubleTapFun,
    Function onLongPressFun,
  }) {
    if (onTapFun == null) {
      onTapFun = () => ToastUtils.show(onTapText);
    }
    if (onDoubleTapFun == null) {
      onDoubleTapFun = () => ToastUtils.show(onDoubleTapText);
    }
    if (onLongPressFun == null) {
      onLongPressFun = () => ToastUtils.show(onLongPressText);
    }
    return GestureDetector(
      onTap: onTapFun,
      onDoubleTap: onDoubleTapFun,
      onLongPress: onLongPressFun,
      child: Container(
        color: backgroundColor,
        height: backgroundHeight,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }

  /// getCenterTextWithTap使用示例
  static Widget buildTextWidgetDemo(String text) {
    return buildTextWidget(
      text,
      textSize: 18,
      textColor: Colors.yellow,
      backgroundColor: Colors.red,
      backgroundHeight: 150,
      onTapText: "demo-单击",
      onDoubleTapText: "demo-双击",
      onLongPressText: "demo-长按",
      onTapFun: () {
        ToastUtils.show("demo-单击-自定义方法");
      },
      onDoubleTapFun: () {
        ToastUtils.show("demo-双击-自定义方法");
      },
      onLongPressFun: () {
        ToastUtils.show("demo-长按-自定义方法");
      },
    );
  }

  /// 返回横线
  static Widget buildLine({Color lineColor: Colors.black, double lineHeight: 5}) {
    return Container(
      color: lineColor,
      height: lineHeight,
    );
  }

  /// 返回竖线
  static Widget buildLineVertical({Color lineColor: Colors.black, double lineWidget: 5, double lineHeight: 10}) {
    return Container(
      color: lineColor,
      width: lineWidget,
      height: lineHeight,
    );
  }

  /// 构建状态栏高度占位,height=27
  static Widget buildStatusBar() {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      height: 27,
    );
  }

  /// 构建标题栏,height=56
  static Widget buildTitleBar() {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      height: 56,
      child: Center(child: Text("我的", style: TextStyle(color: Colors.white, fontSize: 21))),
    );
  }
}
