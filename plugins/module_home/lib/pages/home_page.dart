import 'package:flutter/material.dart';
import 'package:library_core/library_core.dart';
import 'package:module_home/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // print("home- rebuild");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: testChangeLang,
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(S.of(context).home_title),
        // title: Text(S.of(app.context).home_title),
      ),
      body: Builder(
        builder: (context) {
          // print("---- ${S.of(context).home_title}");
          return Text(S.of(context).home_body);
        }
      ),
    );
  }


  void testChangeLang() {

    if (I18nManager.instance.locale == LanguageType.en.locale) {
      I18nManager.instance.setLocale(LanguageType.zh.locale);
    } else {
      I18nManager.instance.setLocale(LanguageType.en.locale);
    }
  }

  void test() {
    // 获取其它 module 记录的数据
    int num = app.mine.getSomeMineData();
    debugPrint("$num");
  }
}
