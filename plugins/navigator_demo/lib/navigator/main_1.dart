import 'package:flutter/material.dart';
import 'package:navigator_demo/navigator/news_page.dart';

import 'home_page_1.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return routeType1();
  }

  // 使用 onGenerateRoute
  Widget routeType2() {

    var route1 = MaterialPageRoute(builder: (_)=> const NewsPage());
    // onGenerateRoute 的类型是一个传入 setting 返回 Route 的 function
    // typedef RouteFactory = Route<dynamic>? Function(RouteSettings settings);

    return MaterialApp(
      home: const MyHomePage(),
      // RouteFactory 类型
      onGenerateRoute: (RouteSettings settings) {
        return route1;
      },
    );
  }

  // 使用 routes 配置
  Widget routeType1() {
    // MaterialApp 的 routes 参数的类型：
    // 只是一个 String 和 context=>Widget 的 Map
    Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{};
    routes['news_page'] = (BuildContext context) => const NewsPage();

    return MaterialApp(
      home: const MyHomePage(),
      routes: routes,
    );
  }

}



