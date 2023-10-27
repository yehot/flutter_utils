import 'package:library_core/library_core.dart';
import 'package:module_home/module_home.dart';
import 'package:module_mine/mine_imp.dart';

class Application extends AppBase {

  @override
  void init() {
    app = this;

    // SDK 初始化

    // 业务模块初始化
    registerModules();
  }

  void registerModules() {
    ModuleManager.instance.register<Home, HomeImp>(HomeImp());
    ModuleManager.instance.register<Mine, MineImp>(MineImp());
  }
}

