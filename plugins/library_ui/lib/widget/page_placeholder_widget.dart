import 'package:flutter/material.dart';

enum PageState {
  loading,
  netError,
  serverError,
  success,
}

// app 全局统一的页面 状态 view，处理网络请求中、请求错误
class PageStateWidget extends StatelessWidget {
  const PageStateWidget({
    super.key,
    this.loadingWidget,
    this.netErrorWidget,
    this.child,
    this.state = PageState.success,
  });

  final Widget? loadingWidget;
  final Widget? netErrorWidget;
  final Widget? child;
  final PageState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case PageState.loading:
        // 请求加载中
        return loadingWidget ?? const EmptyView();
      case PageState.netError:
        // 网络问题
        return netErrorWidget ?? const EmptyView();
      case PageState.success:
        return child ?? const EmptyView();
      case PageState.serverError:
        // 服务问题
        return netErrorWidget ?? const EmptyView();
    }
  }
}


class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
