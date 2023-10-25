import 'package:flutter/material.dart';
import 'package:navigator_demo/fluro_demo/some_page.dart';
import 'router_define.dart';


void main() {
  Application.initRoute();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // fluro 的 router.generator :
      // Route<dynamic>? generator(RouteSettings routeSettings)
      onGenerateRoute: (RouteSettings routeSettings) {
        Route<dynamic>? route = Application.router.generator(routeSettings);

        // 添加 fluro 之外的逻辑：
        // 对应特定的路由 path，不使用 fluro 内置的 Route 配置
        if (routeSettings.name == '/') {
          // 可以添加 modal_bottom_sheet 的逻辑，给 root 页面加一个自定义的 Route
          return MaterialPageRoute(builder: (_)=> SomePage(), settings: route?.settings);
        }
        // onGenerateRoute 方法是会在 push 时，动态被调用，返回一个 Route Page
        return route;
      },
      // onGenerateRoute 的类型是一个传入 setting 返回 Route 的 function
      // typedef RouteFactory = Route<dynamic>? Function(RouteSettings settings);
      // onGenerateRoute: Application.router.generator,
    );
  }
  
  void test(BuildContext context) {
    // 直接用 Navigator 的命名路由进行 push
    Navigator.pushNamed(context, Routes.login);

    // 可以加一个 arguments 参数 (最终还是传给了 RouteSettings 的 arguments)
    Navigator.pushNamed(context, Routes.login, arguments: { "title": "页面"});
  }
}



