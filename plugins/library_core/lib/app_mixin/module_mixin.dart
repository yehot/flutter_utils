import 'package:library_core/module/module.dart';
import 'package:library_core/module/module_manager.dart';
import 'package:library_core/modules/home.dart';
import 'package:library_core/modules/mine.dart';

mixin ModuleMixin {
  T getModule<T extends Module>() => ModuleManager.instance.getModule<T>();

  void register<T extends Module, R extends T>(R module) => ModuleManager.instance.register<T, R>(module);

  List<Module> allModules() => ModuleManager.instance.allModules();


  Home get home => getModule<Home>();
  Mine get mine => getModule<Mine>();
}
