import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/navigation/app_navigation.dart';
import 'package:web_app/src/pages/dashboard/dashboard_page.dart';
import 'package:web_app/src/pages/not_found/not_found_page.dart';
import 'package:web_app/src/pages/notification/notification_page.dart';
import 'package:web_app/src/pages/profile/profile_page.dart';
import 'package:web_app/src/pages/settings/settings_page.dart';
import 'package:web_app/src/pages/task/task_page.dart';
import 'package:web_app/src/route/home.dart';
import 'package:web_app/src/route/route_define.dart';

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
  routes: [ // 以下是 app 所有的一级页面
    homeRouters,
    GoRoute(
      path: RouteDefine.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return DashboardPage();
      },
    ),
    GoRoute(
      path: RouteDefine.task,
      builder: (BuildContext context, GoRouterState state) {
        return TaskPage();
      },
    ),
    GoRoute(
      path: RouteDefine.notification,
      builder: (BuildContext context, GoRouterState state) {
        return NotificationPage();
      },
    ),
    GoRoute(
      path: RouteDefine.profile,
      builder: (BuildContext context, GoRouterState state) {
        return ProfilePage();
      },
    ),
    GoRoute(
      path: RouteDefine.settings,
      builder: (BuildContext context, GoRouterState state) {
        return SettingsPage();
      },
    ),
    GoRoute(
      path: RouteDefine.notFound,
      builder: (BuildContext context, GoRouterState state) {
        String msg = '无法访问: ${state.extra}';
        return NotFoundPage(msg: msg);
      },
    ),
  ],
);
