import 'package:flutter/material.dart';
import 'package:library_core/library_core.dart';
import 'package:module_home/generated/l10n.dart';
import 'package:library_ui/library_ui.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        // title: Text(S.of(context).home_title),
        // TODO: 必须使用 of 才能保证切换语言时，正确刷新
        title: Text(S.current.home_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyNineWidget3(),
            SizedBox(height: 50,),
            MyNineWidget1(),
          ],
        ),
      ),
      // body: Builder(
      //   builder: (context) {
      //     // print("---- ${S.of(context).home_title}");
      //     return Text(S.of(context).home_body);
      //   }
      // ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: GestureDetector(
          onTap: () {
            app.main.changeToTab(AppTab.mine);
          },
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("切换 tab"),
              ],
            ),
          ),
        ),
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
