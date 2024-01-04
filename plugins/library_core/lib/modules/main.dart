import 'package:library_core/module/app_tab.dart';
import 'package:library_core/module/module.dart';

/// 主工程
abstract class Main extends Module {

  // 切换 app 底部主 tab
  void changeToTab(AppTab tab);

  // 获取当前 tab
  AppTab currentTab();
}
