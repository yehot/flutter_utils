
/// app 环境
enum Env {
  debug,
  pre,
  release;

  String get baseUrl {
    switch (this) {
      case Env.debug:
        return 'http://test.xxx.com';
      case Env.pre:
        return 'http://pre.xxx.com';
      case Env.release:
        return 'https://xxx.com';
    }
  }
}
