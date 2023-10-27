
///  flutter build 打包配置的(-dart-define)参数
///     flutter build ipa --release \
//       --dart-define=proxy=10.225.64.38:8888 \
//       --dart-define=debug=true
class PackageEnv {

  // 区分测试包，上架包
  static bool isDebug = const bool.fromEnvironment('debug');
  static bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');

  // 抓包代理配置
  static String proxy = const String.fromEnvironment('proxy');
}
