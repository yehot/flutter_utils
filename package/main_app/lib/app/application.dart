import 'package:flutter/material.dart';
import 'package:library_core/generated/l10n.dart' as core;
import 'package:library_core/library_core.dart';
import 'package:module_home/module_home.dart' as home;
import 'package:module_mine/module_mine.dart' as mine;
import 'package:module_market/module_market.dart' as market;
import 'module/main_impl.dart';


class Application extends IAppBase {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  BuildContext get context => navigatorKey.currentContext!;

  @override
  GlobalKey<NavigatorState> get globalKey => navigatorKey;

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
    ModuleManager.instance.register<Main, MainImpl>(MainImpl());
    ModuleManager.instance.register<Home, home.HomeImp>(home.HomeImp());
    ModuleManager.instance.register<Mine, mine.MineImp>(mine.MineImp());
    ModuleManager.instance.register<Market, market.MarketImpl>(market.MarketImpl());
  }

  // 有任何 package 里新增的独立的多语言文件，需要在这里注册
  void _registerLangModules() {
    // TODO: 目前测试，只有第一个注册的，会生效，其它都会失效
    // 多语言拆包可以用，但只能在初始化时设置一次语言。无法做 app内切换语言
    // 原因： Intl lib 内部实现机制
    I18nManager.instance.registerModule(home.S.delegate);
    I18nManager.instance.registerModule(core.S.delegate);
    I18nManager.instance.registerModule(mine.S.delegate);
  }

}

