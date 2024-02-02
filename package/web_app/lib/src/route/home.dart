import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/pages/home/home_page.dart';
import 'package:web_app/src/route/route_define.dart';

// 首页 + 首页的子页面
final RouteBase homeRouters = GoRoute(
  path: RouteDefine.home,
  builder: (BuildContext context, GoRouterState state) {
    return const HomePage();
  },
  // routes: <RouteBase>[
  //   GoRoute(
  //     path: 'detail',
  //     name: 'colorDetail',
  //     builder: (BuildContext context, GoRouterState state) {
  //       String? selectedColor = state.uri.queryParameters['color'];
  //       Color color = Colors.black;
  //       if (selectedColor != null) {
  //         color = Color(int.parse(selectedColor, radix: 16));
  //       }
  //       return ColorDetailPage(color: color);
  //     },
  //   ),
  //   GoRoute(
  //     path: 'add',
  //     builder: (BuildContext context, GoRouterState state) {
  //       return const ColorAddPage();
  //     },
  //   ),
  // ],
);

