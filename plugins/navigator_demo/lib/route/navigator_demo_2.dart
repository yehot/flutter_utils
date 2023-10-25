import 'package:flutter/material.dart';

void main() { runApp(const MyApp()); }


// 简化 flutter 源码中的实现
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MyNavigator(
      initialPage: MyPage(
        routeName: "/",
        child: const Scaffold(),
      ),
    );
  }
}


// 使用示例
void toNextPage(BuildContext context) {
  MyPage page = MyPage(routeName: "page1", child: const Scaffold());
  MyNavigator.of(context).push(MyMaterialPageRoute(page: page));
  MyNavigator.of(context).pop();
}

class MyMaterialPageRoute extends MyRoute {
  MyMaterialPageRoute({
    required this.page
  }): super(page: page) {
    _animation = AnimationController(vsync: navigator).view;
  }
  
  final MyPage page;
  
  @override
  Widget buildTransition(
    BuildContext context,
    Animation<double> animation,
    Widget child) {
    return Transform.translate(
      offset: Offset(animation.value, 0),
      child: child,
    );
  }
}


abstract class MyRoute {
  MyRoute({
    required this.page,
  });
  final MyPage page;

  Widget buildTransition(
    BuildContext context,
    Animation<double> animation,
    Widget child) {
    return child;
  }

  // MyRoute 持有 MyNavigatorState 的作用
  MyNavigatorState get navigator => _navigator;
  late MyNavigatorState _navigator;

  // 子类需要提供一个 animation
  Animation<double> get animation => _animation;
  late Animation<double> _animation;

  void handlePush({required MyNavigatorState navigator, required MyRoute previousRoute }) {
    // todo: 触发转场动画的逻辑
    _navigator = navigator;
  }

  void handlePop() {
    // todo: 触发转场动画的逻辑
  }
}

class MyPage {
  MyPage({
    required this.routeName,
    required this.child,
  });
  final String routeName;
  final Widget child;
}

// 转场状态的生命周期
enum MyRouteLifeCycle {
  push,
  pushing,
  idle,
  pop,
  popping,
  dispose,
  disposed,
  // ...
}

// 组合模式： 对 MyRoute(MyPage) 和  MyRouteLifeCycle 进行组合
class _MyRouteEntry {
  _MyRouteEntry({
    required this.route,
    required this.lifeCycle,
  });
  final MyRoute route;
  final MyRouteLifeCycle lifeCycle;
}

class MyNavigator extends StatefulWidget {
  const MyNavigator({
    required this.initialPage
  });
  final MyPage initialPage;

  static MyNavigatorState of(BuildContext context) {
    MyNavigatorState navigator = context.findAncestorStateOfType<MyNavigatorState>()!;
    return navigator;
  }

  @override
  MyNavigatorState createState() => MyNavigatorState();
}

class MyNavigatorState extends State<MyNavigator> with SingleTickerProviderStateMixin {
  // 做了一个变化，从 List<MyPage> 改为 List<_MyRouteEntry>
  // _MyRouteEntry 里过了一个 Route 的生命周期管理
  final List<_MyRouteEntry> _history = [];

  @override
  Widget build(BuildContext context) {

    _MyRouteEntry current = _history.last;
    _MyRouteEntry previous = _history[_history.length - 1];
    
    return Stack(
      children: [
        AnimatedBuilder(
          animation: previous.route.animation, // 绑定动画
          builder: (BuildContext context, Widget? child) {
            return previous.route.buildTransition(context, previous.route.animation, child!);
          },
          child: previous.route.page.child,
        ),
        AnimatedBuilder(
          animation: current.route.animation, // 绑定动画
          builder: (BuildContext context, Widget? child) {
            return current.route.buildTransition(context, current.route.animation, child!);
          },
          child: current.route.page.child,
        ),
      ],
    );
  }

  void push(MyRoute newRoute) {
    setState(() {
      _MyRouteEntry newEntry = _MyRouteEntry(route: newRoute, lifeCycle: MyRouteLifeCycle.pop);
      _history.add(newEntry);

      _MyRouteEntry lastEntry = _history.last;
      // 在 MyRoute 的 handlePush 方法里，去触发 MyRoute animation 动画
      newRoute.handlePush(navigator: this, previousRoute: lastEntry.route);
    });
  }

  void pop() {
    setState(() {
      _MyRouteEntry lastEntry = _history.removeLast();
      // 在 MyRoute 的 handlePop 方法里，去触发 MyRoute animation 动画
      lastEntry.route.handlePop();
    });
  }
}
