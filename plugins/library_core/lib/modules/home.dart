import 'package:library_core/module/app_tab.dart';
import 'package:library_core/module/module.dart';

/// implements AppTabPage 的，需要提供一个 app 主 tab 展示的页面
abstract class Home extends Module implements AppTabPage {

  /// 跳转到 home 的二级页面
  void gotoSomeSubPage();

  /// 获取 home 模块的数据
  int getSomeHomeData();
}
