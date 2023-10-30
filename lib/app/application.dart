import 'package:library_core/library_core.dart';
import 'package:module_home/module_home.dart' as home;
import 'package:module_mine/module_mine.dart' as mine;

class Application extends AppBase {

  @override
  Future<void> init() async {
    app = this;
    // 多语言初始化
    await I18nManager.instance.init();
    _registerLangModules();

    // SDK 初始化

    // 业务模块初始化
    _registerModules();
  }

  void _registerModules() {
    ModuleManager.instance.register<Home, home.HomeImp>(home.HomeImp());
    ModuleManager.instance.register<Mine, mine.MineImp>(mine.MineImp());
  }

  void _registerLangModules() {
    I18nManager.instance.registerModule(home.AppLocalizationDelegate());
    I18nManager.instance.registerModule(mine.AppLocalizationDelegate());

  }

}

