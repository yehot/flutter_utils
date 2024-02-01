// import 'package:go_router/go_router.dart';
//
//
//
// // 在 core 创建一个 module 的 route interface
// abstract class IModuleRoute {
//   RouteBase moduleRoutes();
// }
//
// // 模块内部实现
// class ColorModuleRoute implements IModuleRoute {
//   @override
//   RouteBase moduleRoutes() {
//     // 以下可以放到 class 内，不用全局对象
//     _registerAll();
//     return colorRouters;
//   }
//
// }
//
// // 可以放在 模块内部， 只将 path 部分，对外暴露；
// // 也可以像 too bit 的 app module 一样，对外暴露 gotoPage 的方法，连 path 也不全部暴露出去
// // （只暴露 lib 需要对外暴露的 page）
// abstract class ColorRoutes {
//   static String page1 = "page1";
//   static String page2 = "page2";
// }
//
// final Map<String, GoRouterWidgetBuilder?> _pagesRoutes = {
//   // color 页面
//   ColorRoutes.page1: (context, state) {
//     String? selectedColor = state.uri.queryParameters['color'];
//     Color color = Colors.black;
//     if (selectedColor != null) {
//       color = Color(int.parse(selectedColor, radix: 16));
//     }
//     // 也可以用 extra 直接传递数据
//     state.extra;
//     return ColorDetailPage(color: color);
//   },
//
//   // xx 页面
//   ColorRoutes.page2: (context, state) {
//     // 也可以用 extra 直接传递数据
//     return ColorDetailPage(color: state.extra as Color);
//   },
//
//   // 依次将模块的所有页面，都注册
//
// };
//
// // 将一个模块的所有页面，统一注册到一个 lib 的私有文件
// void _registerAll() {
//   _pagesRoutes.forEach((path, builder) {
//     colorRouters.routes.add(GoRoute(path: path, builder: builder));
//   });
// }
//
//
// final RouteBase colorRouters = GoRoute(
//   path: 'color',
//   builder: (BuildContext context, GoRouterState state) {
//     return const ColorPage();
//   },
//   routes: <RouteBase>[
//     GoRoute(
//       path: 'detail',
//       name: 'colorDetail',
//       builder: (BuildContext context, GoRouterState state) {
//         String? selectedColor = state.uri.queryParameters['color'];
//         Color color = Colors.black;
//         if (selectedColor != null) {
//           color = Color(int.parse(selectedColor, radix: 16));
//         }
//         return ColorDetailPage(color: color);
//       },
//     ),
//     GoRoute(
//       path: 'add',
//       builder: (BuildContext context, GoRouterState state) {
//         return const ColorAddPage();
//       },
//     ),
//   ],
// );
