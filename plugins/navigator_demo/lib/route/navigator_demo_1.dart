import 'package:flutter/material.dart';

void main() { runApp(const MyApp()); }

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
  MyNavigator.of(context).push(page);
  MyNavigator.of(context).pop();
}

class MyPage {
  MyPage({
    required this.routeName,
    required this.child
  });
  final String routeName;
  final Widget child;
}

class MyNavigator extends StatefulWidget {
  const MyNavigator({super.key, 
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

class MyNavigatorState extends State<MyNavigator> {
  final List<MyPage> _history = [];
  late MyPage _currentPage;

  @override
  void initState() {
    _currentPage = widget.initialPage;
    super.initState();
  }

  void push(MyPage newPage) {
    setState(() {
      _currentPage = newPage;
      _history.add(newPage);
    });
  }

  void pop() {
    setState(() {
      _history.removeLast();
      _currentPage = _history.last;
    });
  }

  @override
  Widget build(BuildContext context) {
    MyPage current  = _currentPage;
    MyPage previous = _history[_history.length - 1];
    return Stack(
      children: [
        Offstage(
          // push 时，对 current.child 动画做完后，对 previous.child 设置为 offstage
          offstage: true,
          child: previous.child,
        ),
        Offstage(
          // pop 时，对  current.child 设置为 offstage
          offstage: false,
          // 根据 pushing 的状态，对 current 做 translate.x 位移动画
          child: current.child,
        ),
      ],
    );
  }
}
