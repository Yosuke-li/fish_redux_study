import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'entrance/page.dart';
import 'grid/page.dart';
import 'second/page.dart';
import 'three/page.dart';
import 'four/page.dart';

Widget CreateApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'entrance_page': EntrancePage(),
      'grid_page': GridPage(),
      'second_page': SecondPage(),
      'three_page': threePage(),
      'four_page': fourPage(),
    },
  );

  return MaterialApp(
    title: 'FishDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('entrance_page', null),  //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}