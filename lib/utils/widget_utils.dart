import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        height: backgroundHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
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
}
