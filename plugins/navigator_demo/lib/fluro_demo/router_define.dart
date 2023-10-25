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
      // 可以自定义转场，但是不能传一个 Route
      // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const NewsPage()));
      // modal_bottom_sheet 的实现思路是，在 root page 外包裹一个 自定义的 PageRoute （用来在 push 时，添加缩小的动画）
      // 然后 被 push 的页面，也需要包裹到封装的 sheet 里（用来被push时，缩小的动画）

      // 所以 fluro 和 modal_bottom_sheet 无法直接配合使用
      // 对于这种的 push ，可以直接 push(MyRoute(Page))，而不使用 pushName('xx')
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return child;
      },
      // 可以单独指定 转场的动画类型、时长
      // TransitionType? transitionType,
      // Duration transitionDuration = defaultTransitionDuration,
    );


    // router.define 会将 path 和 handler 注册到 FluroRouter 的 _routeTree 里
    // 然后在 push 的时候，MaterialApp 的 onGenerateRoute 回调里，调用  Fluro 的 router.generator(routeSettings)
    // 去通过 routeSettings.name 也就是 path，找到对应的 Handler (也就找到了对应的页面)
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
