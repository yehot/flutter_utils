import 'package:flutter/material.dart';
import 'package:usage_demo/singleton/app_singleton.dart';
import 'package:usage_demo/singleton/logger.dart';

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> with RouteAware {

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
    loggerD("SubPage didPush - 页面被 push 后出现");
  }

  @override
  void didPushNext() {
    loggerD("SubPage didPushNext - push 到下一页");
  }

  @override
  void didPop() {
    loggerD("SubPage didPop - 页面被 pop");
  }

  @override
  void didPopNext() {
    loggerD("SubPage didPopNext - 从页面 pop 后返回");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sub Page"),
      ),
      body: Container(

      ),
    );
  }
}
