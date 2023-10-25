import 'package:flutter/material.dart';
import 'router_define.dart';


void main() {
  Application.initRoute();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // onGenerateRoute 的类型是一个传入 setting 返回 Route 的 function
      // typedef RouteFactory = Route<dynamic>? Function(RouteSettings settings);

      // fluro 的 router.generator :
      // Route<dynamic>? generator(RouteSettings routeSettings)
      onGenerateRoute: Application.router.generator,
    );
  }
  
  void test(BuildContext context) {
    // 直接用 Navigator 的命名路由进行 push
    Navigator.pushNamed(context, Routes.login);

    // 可以加一个 arguments 参数 (最终还是传给了 RouteSettings 的 arguments)
    Navigator.pushNamed(context, Routes.login, arguments: { "title": "页面"});
  }
}



