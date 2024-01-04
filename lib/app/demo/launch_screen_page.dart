import 'package:flutter/material.dart';
import 'package:library_core/i18n/i18n_manager.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LaunchScreenPage extends StatefulWidget {
  const LaunchScreenPage({super.key, required this.title});

  final String title;

  @override
  State<LaunchScreenPage> createState() => _LaunchScreenPageState();
}

class _LaunchScreenPageState extends State<LaunchScreenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          testChangeLang();
        },
      ),
    );
  }

  bool test = false;
  void testChangeLang() {
    test = !test;
    I18nManager.instance.setLocale(test ? LanguageType.en.locale: LanguageType.zh.locale);
  }


  void testModalPresent() {
    // 使用 modal_bottom_sheet 时，如果 root page 的 route 不是被 modal_bottom_sheet 的 MaterialWithModalsPageRoute 包裹

    // 需要将改为父页面 push 时使用  modal_bottom_sheet 的 MaterialWithModalsPageRoute
    // 这样能保证子节点有 modal 效果
    // Navigator.of(context).push(MaterialWithModalsPageRoute(builder: (ctx) => const HomePage2()));
  }

}

