import 'package:flutter/material.dart';
import 'package:usage_demo/singleton/app_singleton.dart';
import 'package:usage_demo/singleton/logger.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> with RouteAware {

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

  // @override
  // void didPush() {
  //   loggerD("BodyWidget didPush");
  // }
  //
  // @override
  // void didPushNext() {
  //   loggerD("BodyWidget didPushNext");
  // }
  //
  // @override
  // void didPop() {
  //   loggerD("BodyWidget didPop");
  // }
  //
  // @override
  // void didPopNext() {
  //   loggerD("BodyWidget didPopNext");
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      width: 100,
      child: const Text("BodyWidget"),
    );
  }
}
