import 'package:library_core/generated/l10n.dart' as core;
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

  // 有任何 package 里新增的独立的多语言文件，需要在这里注册
  void _registerLangModules() {
    // TODO: 目前测试，只有第一个注册的，会生效，其它都会失效
    I18nManager.instance.registerModule(home.S.delegate);
    I18nManager.instance.registerModule(core.S.delegate);
    I18nManager.instance.registerModule(mine.S.delegate);
  }

}

