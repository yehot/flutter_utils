import 'dart:collection';
import 'module.dart';

class ModuleManager {
  static final ModuleManager instance = ModuleManager._();

  final Map<Type, Module> _modules = LinkedHashMap<Type, Module>.from(<Type, Module>{});

  ModuleManager._();

  void register<T extends Module, R extends T>(R module) {
    _modules[T] = module;
  }

  Future<void> initModules() async {
    final List<Future<void>> futures = <Future<void>>[];

    for (Module module in _modules.values) {
      futures.add(module.init());
    }
    await Future.wait<void>(futures);
    futures.clear();

    for (Module module in _modules.values) {
      futures.add(module.afterInit());
    }
    await Future.wait<void>(futures);
    futures.clear();
  }

  T getModule<T extends Module>() {
    return _modules[T] as T;
  }

  List<Module> allModules() {
    return _modules.values.toList(growable: false);
  }
}
