import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_app/src/define/constants.dart';
import 'package:web_app/src/navigation/transition/fade_page_transitions_builder.dart';
import 'package:web_app/src/route/root.dart';
import 'package:web_app/src/route/route_define.dart';


void run_app() {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Admin Panel', // 浏览器 tab 标题
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            // PC 上如果不修改转场，会和 iOS 转场类似
            TargetPlatform.macOS: FadePageTransitionsBuilder(),
            TargetPlatform.windows: FadePageTransitionsBuilder(),
            TargetPlatform.linux: FadePageTransitionsBuilder(),
          }
        ),
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      rootRoute,
    ],
    onException: (BuildContext ctx, GoRouterState state, GoRouter router) {
      router.go(RouteDefine.notFound, extra: state.uri.toString());
    },
  );

}