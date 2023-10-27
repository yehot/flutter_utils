import 'package:flutter/src/widgets/framework.dart';
import 'package:library_core/module/app_tab.dart';
import 'package:library_core/modules/mine.dart';
import 'package:module_mine/pages/mine_page.dart';

class MineImp extends Mine {

  @override
  Future<void> init() async {
    throw UnimplementedError();
  }

  @override
  Future<void> afterInit() async {

  }

  @override
  AppTab get tab => AppTab.mine;

  @override
  Widget get tabPage => MinePage();

  @override
  int getSomeMineData() {
    return 2;
  }

  @override
  void gotoSomeSubPage() {
    // push to some page
  }

}

