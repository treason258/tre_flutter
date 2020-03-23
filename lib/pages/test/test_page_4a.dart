import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tre_flutter/utils/assets_utils.dart';
import 'package:tre_flutter/utils/toast_utils.dart';

class TestPage4a extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage4a> {
  final List<String> images = [
    AssetsUtils.getImage('ic_wallpaper_1.jpg'),
    AssetsUtils.getImage('ic_wallpaper_2.jpg'),
    AssetsUtils.getImage('ic_wallpaper_3.jpg'),
    AssetsUtils.getImage('ic_wallpaper_4.jpg'),
    AssetsUtils.getImage('ic_wallpaper_5.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage4a'),
      ),
      body: Column(
        children: <Widget>[
          _getSwiperDemo(1),
          _getSwiperDemo(2),
          _getSwiperDemo(3),
        ],
      ),
    );
  }

  Widget _getSwiperDemo(int type) {
    double paddingVertical = 0;
    double paddingHorizontal = 0;
    double borderRadius = 0;
    double viewportFraction = 0;
    double scale = 0;
    double paginationMarginBottom = 0;
    switch (type) {
      case 1:
        paddingVertical = 0;
        paddingHorizontal = 0;
        borderRadius = 0;
        viewportFraction = 1;
        scale = null;
        paginationMarginBottom = 10;
        break;
      case 2:
        paddingVertical = 16;
        paddingHorizontal = 15;
        borderRadius = 6;
        viewportFraction = 0.95;
        scale = null;
        paginationMarginBottom = 20;
        break;
      case 3:
        paddingVertical = 16;
        paddingHorizontal = 0;
        borderRadius = 6;
        viewportFraction = 0.8;
        scale = 0.85;
        paginationMarginBottom = 20;
        break;
    }
    return _getSwiper(paddingVertical, paddingHorizontal, borderRadius, viewportFraction, scale, paginationMarginBottom);
  }

  Widget _getSwiper(double paddingVertical, double paddingHorizontal, double borderRadius, double viewportFraction, double scale, double paginationMarginBottom) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 180.0,
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Swiper(
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
              child: GestureDetector(
                onTap: () => ToastUtils.show('onTap | ' + images[index]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[Image.asset(images[index], fit: BoxFit.cover)],
                  ),
                ),
              ),
            );
          },
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(color: Colors.black38, activeColor: Colors.white),
            margin: EdgeInsets.only(bottom: paginationMarginBottom),
          ),
          control: null,
          autoplay: true,
          duration: 300,
          scrollDirection: Axis.horizontal,
          viewportFraction: viewportFraction,
          scale: scale,
          onTap: (int index) => ToastUtils.show('onTap | index=$index'),
        ));
  }
}
