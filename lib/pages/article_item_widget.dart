import 'package:flutter/material.dart';
import 'package:tre_flutter/view_model/article_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final ArticleModel model;
  final int index;
  final GestureTapCallback onTap;

  ArticleItemWidget(this.model, {this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Color(0x00ff0000),
        margin: EdgeInsets.only(top: 0.0),
        // height: 113.0, // 图片高度90；图片上下margin各10；分割线高度3；共=113；也可以不设置
        child: Column(
          children: <Widget>[
            // 内容
            Container(
              color: Color(0x0000ff00),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: _itemContentView,
            ),
            // 分割线
            Container(
              margin: EdgeInsets.only(top: 0.0),
              color: Color(0xffeeeeee),
              constraints: BoxConstraints.expand(height: 3.0),
            )
          ],
        ),
      ),
    );
  }

  Widget get _itemContentView {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                height: 20.0,
                margin: EdgeInsets.only(top: 26.0),
                child: Text(
                  model.time,
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(
          height: 90.0,
          width: 120.0,
          margin: EdgeInsets.only(top: 0.0),
          decoration: BoxDecoration(
            color: Color(0xffe1e1e1),
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: NetworkImage(model.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
