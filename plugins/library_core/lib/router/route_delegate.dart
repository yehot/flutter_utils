import 'package:flutter/material.dart';
import 'page.dart';

class MyRouterDelegate extends RouterDelegate<List<RouteSettings>>
  with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {

  static MyRouterDelegate of(BuildContext context) {
    return Router.of(context).routerDelegate as MyRouterDelegate;
  }

  MyRouterDelegate({
    required this.home,
    this.navigatorKey,
    this.observers,
  }) {
    push(home, routeName: "/");
  }

  final List<XPage> _pages = [];
  final Widget home;

  @override
  final GlobalKey<NavigatorState>? navigatorKey;

  // 路由监听
  final List<NavigatorObserver>? observers;

  // 可以添加路由的拦截逻辑
  // final List<XRouteInterceptor> _interceptors;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      // initialRoute:
      pages: _pages,
      onPopPage: _onPopPage,
      observers: observers ?? [],
      // 404 页面处理
      // onUnknownRoute: ,
    );
  }

  bool canPop() => _pages.length > 1;

  bool _onPopPage(Route route, dynamic result) {
    // return route.didPop(result);
    if (!route.didPop(result)) return false;
    if (canPop()) {
      _pages.last.didPop(result);
      _pages.removeLast();
      // onPageChange();
      return true;
    } else {
      return false;
    }
  }

  Future<T?> push<T extends Object?>(Widget widget, {
    String? routeName,
  }) {
    final String name = routeName ?? widget.runtimeType.toString();
    final XPage<T> page = XPage<T>(
      child: widget,
      name: name,
    );
    // _checkDuplicatedPage(page);
    _pages.add(page);
    notifyListeners();
    return page.popped;
  }

  void pop<T extends Object?>([T? result]) {
    bool canPop = navigatorKey?.currentState?.canPop() ?? false;
    assert(canPop, 'router delegate canPop is false');
    if (canPop) {
      navigatorKey?.currentState?.pop(result);
    }
  }

  void popUntil(RoutePredicate predicate) {
    navigatorKey?.currentState?.popUntil(predicate);
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

}
