class ArticleModel {
  static const int ORIGIN_CCTV = 1;
  static const int ORIGIN_JUHE_TOUTIAO = 2;
  static const int ORIGIN_JUHE_WEIXIN = 3;

  final String title;
  final String image;
  final String time;
  final String url;

  ArticleModel({
    this.title,
    this.image,
    this.time,
    this.url,
  });

  static ArticleModel fromDict(Map<String, dynamic> map) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(map['pubDate']));
    ArticleModel model = ArticleModel(
      title: map['itemTitle'] ?? '新闻标题解析异常',
      image: ((map['itemImageNew'] as List).first as Map)['imgUrl'],
      time: dateTime.year.toString() + '-' + dateTime.month.toString() + '-' + dateTime.day.toString() + ' ' + dateTime.hour.toString() + ':' + dateTime.minute.toString(),
      url: map['detailUrl'],
    );
    return model;
  }

  static Uri getUri(int origin) {
    Uri uri;
    switch (origin) {
      case ArticleModel.ORIGIN_CCTV:
        // http://api.cportal.cctv.com/api/rest/navListInfo/getHandDataListInfoNew?id=Nav-9Nwml0dIB6wAxgd9EfZA160510&toutuNum=5&version=1&p=5&n=20
        uri = Uri(scheme: 'http', host: 'api.cportal.cctv.com', path: '/api/rest/navListInfo/getHandDataListInfoNew', query: 'id=Nav-9Nwml0dIB6wAxgd9EfZA160510&toutuNum=5&version=1&p=5&n=20');
        break;
      case ArticleModel.ORIGIN_JUHE_TOUTIAO:
        // http://v.juhe.cn/toutiao/index?key=3b2f1817a3494b6f1e558f24fbf00aeb&type=keji
        uri = Uri(scheme: 'http', host: 'v.juhe.cn', path: '/toutiao/index', query: 'key=3b2f1817a3494b6f1e558f24fbf00aeb&type=keji');
        break;
      case ArticleModel.ORIGIN_JUHE_WEIXIN:
        // http://v.juhe.cn/weixin/query?key=352105dbc59ac1931bd63d5b01efa25a&pno=&ps=&dtype=
        uri = Uri(scheme: 'http', host: 'v.juhe.cn', path: '/weixin/query', query: 'key=352105dbc59ac1931bd63d5b01efa25a&pno=&ps=&dtype=');
        break;
    }
    return uri;
  }

  static Future<List<ArticleModel>> parseList(Map responseData, int origin) async {
    List dataList;
    switch (origin) {
      case ORIGIN_CCTV:
        dataList = responseData['itemList'] as List;
        break;
      case ORIGIN_JUHE_TOUTIAO:
        dataList = responseData['result']['data'] as List;
        break;
      case ORIGIN_JUHE_WEIXIN:
        dataList = responseData['result']['list'] as List;
        break;
    }

    var modelList = dataList.map((map) {
      map = map as Map;
      ArticleModel model = parseItem(map, origin);
      return model;
    }).toList();
    return modelList;
  }

  static ArticleModel parseItem(Map<String, dynamic> map, int origin) {
    String title;
    String image;
    String time;
    String url;
    switch (origin) {
      case ORIGIN_CCTV:
        title = map['itemTitle'] ?? '新闻标题解析异常';
        image = ((map['itemImageNew'] as List).first as Map)['imgUrl'];
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(map['pubDate']));
        time = dateTime.year.toString() + '-' + dateTime.month.toString() + '-' + dateTime.day.toString() + ' ' + dateTime.hour.toString() + ':' + dateTime.minute.toString();
        url = map['detailUrl'];
        break;
      case ORIGIN_JUHE_TOUTIAO:
        title = map['title'];
        image = map['thumbnail_pic_s'];
        time = map['date'];
        url = map['url'];
        break;
      case ORIGIN_JUHE_WEIXIN:
        title = map['title'];
        image = '';
        time = map['source'];
        url = map['url'];
        break;
    }

    ArticleModel model = ArticleModel(
      title: title,
      image: image,
      time: time,
      url: url,
    );
    return model;
  }

  static ArticleModel parseItem888(Map<String, dynamic> map, int origin) {
    switch (origin) {
      case ORIGIN_CCTV:
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(map['pubDate']));
        ArticleModel model = ArticleModel(
          title: map['itemTitle'] ?? '新闻标题解析异常',
          image: ((map['itemImageNew'] as List).first as Map)['imgUrl'],
          time: dateTime.year.toString() + '-' + dateTime.month.toString() + '-' + dateTime.day.toString() + ' ' + dateTime.hour.toString() + ':' + dateTime.minute.toString(),
          url: map['detailUrl'],
        );
        return model;
        break;
      case ORIGIN_JUHE_TOUTIAO:
        ArticleModel model = ArticleModel(
          title: map['title'] ?? '新闻标题解析异常',
          image: map['thumbnail_pic_s'],
          time: map['date'],
          url: map['url'],
        );
        return model;
        break;
    }
  }
}
