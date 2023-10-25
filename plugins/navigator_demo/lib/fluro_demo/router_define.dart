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

    router.define(home,
      handler: Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const SomePage();
      }),
      // 可以自定义转场
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return child;
      },
      // 可以单独指定 转场的动画类型、时长
      // TransitionType? transitionType,
      // Duration transitionDuration = defaultTransitionDuration,
    );



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
