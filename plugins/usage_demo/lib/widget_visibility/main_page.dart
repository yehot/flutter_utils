import 'package:flutter/material.dart';
import 'package:usage_demo/singleton/app_singleton.dart';
import 'package:usage_demo/singleton/logger.dart';
import 'package:usage_demo/widget_visibility/body_widget.dart';
import 'package:usage_demo/widget_visibility/sub_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with RouteAware {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    app.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    app.routeObserver.unsubscribe(this);
    super.dispose();
  }


  @override
  void didPush() {
    loggerD("MainPage didPush - 页面被 push 后出现");
  }

  @override
  void didPushNext() {
    loggerD("MainPage didPushNext - push 到下一页");
  }

  @override
  void didPop() {
    loggerD("MainPage didPop - 页面被 pop");
  }

  @override
  void didPopNext() {
    loggerD("MainPage didPopNext - 从页面 pop 后返回");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) {
              return const SubPage();
            })
          );
        },
        child: const Text("Next"),
      ),
      body: const BodyWidget(),
    );
  }
}
