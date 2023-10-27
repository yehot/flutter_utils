import 'package:library_core/module/app_tab.dart';
import 'package:library_core/module/module.dart';

/// implements AppTabPage 的，需要提供一个 app 主 tab 展示的页面
abstract class Mine extends Module implements AppTabPage {

  /// 跳转到 的二级页面
  void gotoSomeSubPage();

  /// 获取  模块的数据
  int getSomeMineData();
}
