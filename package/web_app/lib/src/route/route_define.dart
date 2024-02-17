
// 可以放在 模块内部， 只将 path 部分，对外暴露；
// 也可以像 too bit 的 app module 一样，对外暴露 gotoPage 的方法，连 path 也不全部暴露出去
// （只暴露 lib 需要对外暴露的 page）
import 'package:flutter/material.dart';

// 一级页面
abstract class RouteDefine {
  static String root = "/";
  static String login = "login";
  // static String main = "main";
  static String home = "home";
  static String notFound = "404";

  static String dashboard = "dashboard";
  static String task = "task";
  static String color = "color";
  static String notification = "notification";
  static String profile = "profile";
  static String settings = "settings";
}



// Map<String, String> kRouteLabelMap = {
//   '': '',
//   '/profile': '我的',
//   '/settings': '系统设置',
// };


String calcRouteName(BuildContext context, String path) {
  // String? result = kRouteLabelMap[path];
  // if (result != null) return result;
  return path;
  return '未知路由';
}
