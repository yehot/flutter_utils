import 'package:flutter/cupertino.dart';
import 'package:library_core/router/route_delegate.dart';

mixin NavigatorMixin {

  BuildContext get context;

  Future<T?> push<T extends Object?>(dynamic page, {
    String? routeName,
  }) {
    return MyRouterDelegate.of(context).push(
      page,
      routeName: routeName,
    );
  }

  // Future<T?> pushPath<T extends Object?>(String path, {Object? arguments}) {
  //   return MyRouterDelegate.of(context).pushPath(path, arguments: arguments);
  // }

  // Future<T?> pushReplace<T extends Object?>(
  //   dynamic page, {
  //     String? routeName,
  //     bool singlePage = true,
  //     bool fullscreenDialog = false,
  //     XPageRouteBuilder<T>? routeBuilder,
  //     XPageTransitions? transitions,
  //     Curve? curve,
  //   }) {
  //   return MyRouterDelegate.of(context).replace(
  //     page,
  //     routeName: routeName,
  //     routeBuilder: routeBuilder,
  //     singlePage: singlePage,
  //     fullscreenDialog: fullscreenDialog,
  //     transitions: transitions,
  //     curve: curve,
  //   );
  // }

  // Future<T?> pushReplacePath<T extends Object?>(String path, {Object? arguments}) {
  //   return MyRouterDelegate.of(context).replacePath(path, arguments: arguments);
  // }

  // void redirect(String path) {
  //   return MyRouterDelegate.of(context).redirect(path);
  // }

  void pop<T extends Object?>([T? result]) {
    MyRouterDelegate.of(context).pop(result);
  }

  void popUntil(RoutePredicate predicate) {
    MyRouterDelegate.of(context).popUntil(predicate);
  }
}
