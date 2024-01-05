import 'dart:async';

import 'package:flutter/material.dart';

class XPage<T> extends MaterialPage<T> {
  XPage({
    required Widget child,
    String? name,
  }) : super(
    child: child,
    name: name,
  );

  Future<T?> get popped => _popCompleter.future;
  final Completer<T?> _popCompleter = Completer<T?>();

  bool didPop(T? result) {
    _popCompleter.complete(result);
    return true;
  }
}
