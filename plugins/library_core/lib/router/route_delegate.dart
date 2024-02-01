import 'package:flutter/material.dart';
import 'page.dart';

// too bit 版本的实现
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
    // 这里可以不用自己添加 home，使用 RouterDelegate 的 setInitialRoutePath?
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
      // Navigator 的 onPopPage 和 RouterDelegate 的 popRoute 两个回调都和栈的回退有关。但它俩的作用是不同的，
      onPopPage: _onPopPage,
      observers: observers ?? [],
      // 404 页面处理
      // onUnknownRoute: ,
    );
  }

  bool canPop() => _pages.length > 1;

  // _onPopPage 是这 Navigator 的
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

  // 使用 pushNamed 的命名路由，还需要保证所有页面的路由名称不能重复？
  // eg: a/b/c 的页面路由，有页面
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

    // RouterDelegate 本身只是一个 Listenable，已经被 _RouterState 等监听
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

  // 会在操作系统设置路由时被触发。比如 web 浏览器输入 url 时
  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

}
