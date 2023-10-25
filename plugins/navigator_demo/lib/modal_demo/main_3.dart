import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:navigator_demo/fluro_demo/router_define.dart';
import 'package:navigator_demo/fluro_demo/some_page.dart';
import 'package:navigator_demo/navigator/news_page.dart';


void main() {
  Application.initRoute();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return noRouteType();
  }

  Widget noRouteType() {
    return MaterialApp(
      home: SomePage(),
    );
  }

  Widget _fluroType() {
    return MaterialApp(
      onGenerateRoute: (RouteSettings routeSettings) {
        Route<dynamic>? route = Application.router.generator(routeSettings);

        if (routeSettings.name == '/') {
          // 使用  modal_bottom_sheet 需要修改根 Route 为 modal_bottom_sheet 的 Route
          // 才能在任意页面 push 时，使用 modal 效果
          // 不能直接使用 MaterialPageRoute:
          // - MaterialPageRoute and CupertinoPageRoute do not allow animated translation to/from routes that are not the same type.
          return MaterialPageRoute(builder: (_)=> SomePage(), settings: route?.settings);
        }
        return route;
      },
    );
  }

  void test(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const NewsPage()));

    // 将改为父页面 push 时使用  modal_bottom_sheet 的 MaterialWithModalsPageRoute
    // 这样能保证子节点有 modal 效果 （即使  MaterialApp 的 onGenerateRoute 的 / path 没有被包裹 modal 的 Route ）
    Navigator.of(context).push(MaterialWithModalsPageRoute(builder: (ctx) => const NewsPage()));
  }

}



