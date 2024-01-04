import 'package:library_core/library_core.dart';

mixin ModuleMixin {
  T getModule<T extends Module>() => ModuleManager.instance.getModule<T>();

  void register<T extends Module, R extends T>(R module) => ModuleManager.instance.register<T, R>(module);

  List<Module> allModules() => ModuleManager.instance.allModules();


  Home get home => getModule<Home>();
  Mine get mine => getModule<Mine>();
  Main get main => getModule<Main>();
}
