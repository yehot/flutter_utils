import 'package:flutter/material.dart';
import 'package:library_core/library_core.dart';


class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页2"),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: GestureDetector(
          onTap: () {
            app.main.changeToTab(AppTab.home);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("回到 tab1"),
            ],
          ),
        ),
      ),
    );
  }
}

