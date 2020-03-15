import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';

class TestPage4 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage4> {
  final List<String> images = [
    'images/ic_wallpaper_1.jpg',
    'images/ic_wallpaper_2.jpg',
    'images/ic_wallpaper_3.jpg',
    'images/ic_wallpaper_4.jpg',
    'images/ic_wallpaper_5.jpg',
  ];

  final List<String> descriptions = [
    '壁纸描述1',
    '壁纸描述2',
    '壁纸描述3',
    '壁纸描述4',
    '壁纸描述5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage4'),
      ),
      body: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 180.0,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Swiper(
                itemCount: images.length,
                itemBuilder: _itemBuilder,
                pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.black38,
                    activeColor: Colors.white,
                  ),
                ),
                control: null,
                duration: 300,
                viewportFraction: 1,
                scrollDirection: Axis.horizontal,
                autoplay: true,
                onTap: (int index) {
                  showToast('点击了第$index个');
                },
              )),
          Center(
            child: SizedBox.fromSize(
              size: Size.fromHeight(180.0),
              child: Swiper(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        showToast(descriptions[index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.asset(images[index], fit: BoxFit.cover),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                //选中时的指示器
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.black38,
                      activeColor: Colors.white,
                    ),
                    margin: const EdgeInsets.only(bottom: 22.0)),
                control: null,
                duration: 300,
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.95,
                autoplay: true,
                onTap: (int index) {
                  showToast('点击了第$index个');
                },
              ),
            ),
          ),
          Center(
            child: SizedBox.fromSize(
              size: Size.fromHeight(180.0),
              child: Swiper(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                    child: GestureDetector(
                      onTap: () {
                        showToast(descriptions[index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.asset(images[index], fit: BoxFit.cover),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                //选中时的指示器
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.black38,
                      activeColor: Colors.white,
                    ),
                    margin: const EdgeInsets.only(bottom: 22.0)),
                control: null,
                duration: 300,
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.8,
                scale: 0.85,
                autoplay: true,
                onTap: (int index) {
                  showToast('点击了第$index个');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Image.asset(images[index], fit: BoxFit.fill);
  }
}
