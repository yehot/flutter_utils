import 'package:flutter/material.dart';
import 'package:library_core/i18n/i18n_manager.dart';
import 'package:module_mine/generated/l10n.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("mine - rebuild");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: testChangeLang,
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(S.of(context).mine_title),
      ),
      body: Text(S.of(context).mine_title),
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
