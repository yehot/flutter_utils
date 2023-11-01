import 'package:flutter/material.dart';

enum LanguageType {
  en,
  zh;

  static List<Locale> supportedLocales() {
    return LanguageType.values.map((e) => e.locale).toList();
  }

  Locale get locale {
    switch (this) {
      case LanguageType.zh:
        return const Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN');
      case LanguageType.en:
        return const Locale.fromSubtags(languageCode: 'en', countryCode: 'US');
    }
  }

  // 设置中显示的文案
  String get sName {
    switch (this) {
      case LanguageType.zh:
        return '简体中文';
      case LanguageType.en:
        return 'English';
    }
  }

  String get languageTag => locale.toLanguageTag();
}


class I18nManager extends ChangeNotifier {
  static final I18nManager instance = I18nManager._();
  I18nManager._();

  final List<String> _supportLanguages = <String>[];

  // 默认语言
  Locale _locale = LanguageType.en.locale;
  Locale get locale => _locale;

  // 注册模块
  void registerModule<T>(LocalizationsDelegate<T> module) {
    localizationsDelegates.add(module);
  }

  Future<void> init() async {
    _supportLanguages.addAll(supportedLocales.map((e) => e.toLanguageTag()));

    // TODO: 从 SP 读取选取的语言，设置到对应模块
    // _box = await Hive.openBox<String>(_boxName);
    // String language = _box?.get(_languageKey) ?? await _defaultLanguage();
    // final List<String> codes = language.split('-');
    // if (codes.length > 1) {
    //   _locale = Locale(codes[0], codes[1]);
    // } else {
    //   _locale = Locale(codes[0]);
    // }
    // await S.load(_locale);
  }


  // 切换语言
  Future<void> setLocale(Locale locale) async {
    if (_supportLanguages.contains(locale.toLanguageTag())) {
      if (_locale != locale) {
        _locale = locale;
        // TODO: 本地持久化，记录到 SP
        // _saveLocale(locale.toLanguageTag());

        // reload 所有的 module
        // TODO: 这里写不写，都没有区别
        localizationsDelegates.forEach((e) async {
          await e.load(locale);
        });
        notifyListeners();
      }
    }
  }

  // 支持的语言种类
  List<Locale> get supportedLocales => LanguageType.supportedLocales();


  List<LocalizationsDelegate<dynamic>> localizationsDelegates = [];

  Locale? localResolutionCallback(Locale? locale, Iterable<Locale> supportLocales) {
    return _locale;
  }
}