import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_app/src/define/constants.dart';
import 'package:web_app/src/route/root.dart';


void run_app() {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[rootRoute],
    onException: (BuildContext ctx,GoRouterState state, GoRouter router){
      router.go('/404', extra: state.uri.toString());
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Admin Panel', // 浏览器 tab 标题
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      ),
    );
  }
}