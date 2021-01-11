import 'package:oktoast/oktoast.dart';
import 'package:tre_flutter/utils/log_utils.dart';
import 'package:tre_flutter/utils/toast_utils.dart';

class XinListModel {
  final String carimg_src; // 车图
  final String carserie; // 品牌车系
  final String carname; // 车名
  final String carnotime; // 车龄
  final String mileage; // 里程
  final String price; // 价格
  final String shoufu_price; // 首付
  final List tags_sort; // 标签

  XinListModel({
    this.carimg_src,
    this.carserie,
    this.carname,
    this.carnotime,
    this.mileage,
    this.price,
    this.shoufu_price,
    this.tags_sort,
  });

  static Uri getUri() {
    return Uri(
        scheme: 'http',
        host: 'apis.fat.xin.com',
        path: '/car_search/search',
        query:
        '_apikey=201049&abtest=a&abtest_recommend=c&abtest_tags=a&app_source=3&appver=11.6.0.debug&brandid=135&brandname=%E6%B2%83%E5%B0%94%E6%B2%83&c_p=0&channel=unknow&cityid=201&districtid=&gps_type=&group_id=&imei=&imsi=&ip=10.10.33.25&latitude=39.97668&list_type=1&loc_num=0&longitude=116.428744&n_p=0&nb=c3fadcadd3985fa9b20009b87f4e4d81&net=wifi&oaid=&offset=0&os=android&p_p=0&page_info=&provinceid=2&ref=HomeFragment&search_cityid=201&serieid=1702_3057&seriename=XC60&series_type=1&st=0&sysver=29&task_id=&tmpid=&tpg_serieid=1702&ts=1610347027501&u=src%253Du2_app%2526uid%253D1928183883&uid=1928183883&url=SeriesCatalogActivity&uuid=a6ae463b-cc85-44f3-a11e-87ff35274af7&x=bd5471e0460e0c5de4fec95d3782c752&xdid=86a2bcf8327c402e0e97ef320a94f971&zg_num=0');
  }

  static Future<List<XinListModel>> parseList(Map responseData) async {
    log('XinModel | parseList | responseData = $responseData');
    log('XinModel | parseList | responseData0 = ' + responseData['data']['list'][3].toString());
    List carList = List<XinListModel>();

    var message = responseData['message'];
    ToastUtils.show(message);

    var data = responseData['data'];
    if (data != null) {
      List dataList = data['list'] as List;
      carList = dataList.map((map) {
        map = map as Map;
        XinListModel model = XinListModel(
          carimg_src: map['carimg_src'],
          carserie: map['carserie'],
          carname: map['carname'],
          carnotime: map['carnotime'],
          mileage: map['mileage'],
          price: map['price'],
          shoufu_price: map['shoufu_price'],
          tags_sort: map['tags_sort'],
        );
        return model;
      }).toList();
    } else {
      ToastUtils.show(message);
    }
    return carList;
  }
}

/// 打印日志
void log(String msg) {
  LogUtils.printLog('matengfei | xin_list_model.dart | $msg');
}

// mData.getTags_sort()
// mData.getPrice() mData.getShoufu_price()
