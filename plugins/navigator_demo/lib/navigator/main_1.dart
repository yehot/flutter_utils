import 'package:flutter/material.dart';
import 'package:navigator_demo/navigator/home_page_1.dart';
import 'package:navigator_demo/navigator/news_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// routes 参数是适合于一些简单的路由映射关系。routes 只是提供了字符串和组件的映射关系，
    /// onGenerateRoute 可以访问到 RouteSettings 对象，获取路由跳转时的配置信息
    return MaterialApp(
      routes: routeMap,
      initialRoute: '/',
      onUnknownRoute: _onUnknownRoute,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  /// 对应没有参数的界面路由
  Map<String, WidgetBuilder> get routeMap => {
    '/': (ctx) => const NewsPage(),
    '/add_color': (ctx) => const NewsPage(),
    '/color_detail': (ctx) {
      // 可以获取 RouteSettings ，但并不推荐这种方式
      // 还是不能配置 route 转场动画等参数
      RouteSettings? settings = ModalRoute.of(ctx)?.settings;
      Color? color = settings?.arguments as Color?;
      return NewsPage();
    },
  };

  /// 对应有参数的路由
  Route? _onGenerateRoute(RouteSettings settings) {
    String? name = settings.name;
    Widget? child;
    if (name == '/color_detail') {
      Color color = settings.arguments as Color;
      child = NewsPage();
    }

    if (child != null) {
      return MaterialPageRoute(
        builder: (ctx) => child!,
        settings: settings,
      );
    }
    return null;
  }

  Route? _onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (ctx) => const MyHomePage(),
      settings: settings,
    );
  }

  void test(BuildContext context) {
    Navigator.of(context).pushNamed('/color_detail', arguments: {"key":"v"});
  }

}