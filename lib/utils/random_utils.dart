import 'dart:math';

import 'package:tre_flutter/view_model/article_model.dart';

class RandomUtils {
  /// 随机数对象
  static Random mRandom = Random();

  /// 随机返回数据源
  static int getOrigin() {
    int origin = ArticleModel.ORIGIN_CCTV;
    int next = mRandom.nextInt(10);
    switch (next % 3) {
      case 0:
        origin = ArticleModel.ORIGIN_CCTV;
        break;
      case 1:
        origin = ArticleModel.ORIGIN_JUHE_TOUTIAO;
        break;
      case 2:
        origin = ArticleModel.ORIGIN_JUHE_WEIXIN;
        break;
    }
    return origin;
  }

  /// 随机返回true和false
  static bool getTrueOrFalse() {
    return mRandom.nextBool();
//    return false;
//    return true;
  }
}
