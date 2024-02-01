import 'package:flutter/material.dart';

class MyRouterDelegate extends RouterDelegate<List<RouteSettings>>
  with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {

  // 在 Navigator.10 中，_history 是私有，无法直接操作（NavigatorState）
  // List<_RouteEntry> _history = <_RouteEntry>[];

  // 和 Navigator 里的 Page list 是一样的
  // 只是可以便于自己管理、操作
  final List<Page> _pages = [];

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // WidgetsApp.router 构造时，内部没有 Navigator 组件，而路由栈的维护需要使用 Navigator 组件。
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      // onPopPage: _onPopPage,
    );
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

}
