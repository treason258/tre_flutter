class ArticleModel {
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
}
