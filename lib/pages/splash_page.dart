import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tre_flutter/config/router_manger.dart';
import 'package:tre_flutter/utils/assets_utils.dart';
import 'package:tre_flutter/utils/navigator_utils.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed(RouteName.tab);
      NavigatorUtils.jumpByName(context, RouteName.tab, replacement: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(AssetsUtils.getImage('launch_image.png'), fit: BoxFit.fill),
          Align(
            alignment: Alignment(0, 0),
            child: Text(
              'Welcome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
