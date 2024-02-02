import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/navigation/views/app_navigation.dart';
import 'package:web_app/src/route/home.dart';

// ShellRoute 用于不保持活性嵌套导航，
// StatefulShellRoute 会保存状态类的活性
final RouteBase appRoute = ShellRoute(
  builder: (BuildContext context, GoRouterState state, Widget child) {
    // NOTE:
    // shell route 的 builder 方法，会返回一个 子 route build 的页面
    // 将这个 child 作为参数，传入 AppNavigation 布局中，以实现 page 中包了一个完整 route page
    // 本质上就是将 navigation 1.0 中的 page 作为 child 传过来，放入其它 page 中作为页面的一部分
    return AppNavigation(child: child);
  },
  routes: <RouteBase>[
    homeRouters,
    // GoRoute(
    //   path: 'counter',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const CounterPage();
    //   }),
    // sortRouters,
    // GoRoute(
    //   path: 'user',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const UserPage();
    //   },
    // ),
    // GoRoute(
    //   path: 'settings',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const SettingPage();
    //   },
    // ),
    // GoRoute(
    //   path: '404',
    //   builder: (BuildContext context, GoRouterState state) {
    //     String msg = '无法访问: ${state.extra}';
    //     return EmptyPanel(msg: msg);
    //   },
    // )
  ],
);
