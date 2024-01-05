import 'package:flutter/material.dart';
import 'package:library_log/logger.dart';

/// 监听导航栈的变化
class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    loggerD('NavigatorObserver--didPop--from:${route.settings.name}--to:${previousRoute?.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    final fromName = previousRoute?.settings.name ?? '';
    final toName = route.settings.name;
    loggerD('NavigatorObserver--didPush--from:${previousRoute?.settings.name}--to:${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    loggerD('NavigatorObserver--didReplace--newRoute:${newRoute?.settings.name}--oldRoute:${oldRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    loggerD('NavigatorObserver--didRemove--from:${route.settings.name}--to:${previousRoute?.settings.name}');
  }
}
