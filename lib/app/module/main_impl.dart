import 'package:flutter_utils/app/main/main_tab_controller.dart';
import 'package:get/get.dart';
import 'package:library_core/module/app_tab.dart';
import 'package:library_core/modules/main.dart';

/// 回调接口
class MainImpl extends Main {
  @override
  Future<void> init() async {}

  @override
  Future<void> afterInit() async {}

  @override
  void changeToTab(AppTab tab) {
    // 使用 GetX 可以不依赖 context
    Get.find<MainTabController>().changeToTab(tab);
  }

  @override
  AppTab currentTab() {
    return Get.find<MainTabController>().currentTab();
  }

}
