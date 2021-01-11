import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tre_flutter/utils/assets_utils.dart';
import 'package:tre_flutter/utils/log_utils.dart';
import 'package:tre_flutter/utils/toast_utils.dart';

import 'model/xin_list_model.dart';

class XinDetailPage extends StatefulWidget {
  XinListModel xinModel;
  String carserie;

  XinDetailPage({
    this.xinModel,
    this.carserie,
  });

  @override
  _XinDetailPageState createState() => _XinDetailPageState();
}

class _XinDetailPageState extends State<XinDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.xinModel.carserie + " " + widget.xinModel.carname),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://c.xinstatic.com//o//20200704//1225//5f0004b499fea991239.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Image.asset(AssetsUtils.getImage('ic_wallpaper_8.jpg'), fit: BoxFit.cover),
                        Text("价格：" + widget.xinModel.price),
                        Text(widget.xinModel.carserie + " " + widget.xinModel.carname),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        Center(),
                        Align()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 打印日志
void log(String msg) {
  LogUtils.printLog('matengfei | xin_detail_page.dart | $msg');
}
