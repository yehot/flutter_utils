import 'package:flutter/material.dart';
import 'package:library_core/i18n/i18n_manager.dart';
import 'package:module_mine/generated/l10n.dart';
import 'package:module_mine/pages/test_page.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("mine - rebuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(S.of(context).mine_title),
      ),
      body: Text(S.of(context).mine_title),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: GestureDetector(
          onTap: () {
            var route2 = MaterialPageRoute(builder: (_)=> const TestPage(),);
            Navigator.of(context, rootNavigator: true).push(route2);
          },
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("push page"),
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

}
