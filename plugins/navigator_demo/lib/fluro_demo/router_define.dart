import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'some_page.dart';

class Application {
  static late final FluroRouter router = FluroRouter();

  static void initRoute() {
    Routes.configureRoutes(router);
  }

}


// 路由配置
class Routes {
  static String home = "/page_1";
  static String login = "/page_2";

  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const SomePage();
      })
    );

    router.define(login, handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const SomePage();
      })
    );

    // 路由未找到时配置
    router.notFoundHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
  }
}
