import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'page_1.dart';
import 'route_delegate.dart';

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

MyRouterDelegate _routerDelegate = MyRouterDelegate();

class _BooksAppState extends State<BooksApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Router(
        routerDelegate: _routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
        routeInformationParser: MyRouteParser(),
      ),
    );
  }

  void test1() {
    // 写法3
    var app = MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: MyRouteParser(),
      backButtonDispatcher: RootBackButtonDispatcher(),
    );

    // 写法2
    app = MaterialApp(
      home: Router(
        routerDelegate: _routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
        routeInformationParser: MyRouteParser(),
      ),
    );
  }

  void test() {
    // 写法1
    var app = MaterialApp(
      home: Navigator(
        pages: [
          // 区别于 1.0 的写法，1.0 push 的是 PageRoute
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return HomeScreen();
          //     }),);

          // 2.0 管理的是 Page
          MaterialPage(
            key: ValueKey('BooksListPage'),
            child: Scaffold(),
          )
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }

}

class MyRouteParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(routeInformation.location ?? "");
  }

  @override
  RouteInformation restoreRouteInformation(String configuration) {
    return RouteInformation(location: configuration);
  }
}
