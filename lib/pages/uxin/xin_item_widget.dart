import 'package:flutter/material.dart';
import 'package:tre_flutter/utils/color_utils.dart';
import 'package:tre_flutter/utils/widget_utils.dart';
import 'package:tre_flutter/view_model/article_model.dart';

import 'model/xin_list_model.dart';

class XinItemWidget extends StatelessWidget {
  final XinListModel model;
  final int index;
  final int indexReal;
  final GestureTapCallback onTap;

  XinItemWidget(this.model, {this.index, this.indexReal, this.onTap});

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
            WidgetUtils.buildLine(lineHeight: 3, lineColor: ColorUtils.ffeeeeee),
          ],
        ),
      ),
    );
  }

  Widget get _itemContentView {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 90.0,
          width: 120.0,
          margin: EdgeInsets.only(top: 0.0),
          decoration: BoxDecoration(
            color: Color(0xffe1e1e1),
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: NetworkImage(model.carimg_src),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.carserie + " " + model.carname,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                model.carnotime + " / " + model.mileage + "公里",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                model.tags_sort.length > 0 ? model.tags_sort[0]["name"] : "",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                model.price + " " + model.shoufu_price,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xffff4800),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
