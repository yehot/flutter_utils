import 'package:flutter/material.dart';
import 'package:library_core/library_core.dart';
import 'pages/MarketPage.dart';


class MarketImpl extends Market {

  @override
  Future<void> init() async {
    throw UnimplementedError();
  }

  @override
  Future<void> afterInit() async {

  }

  @override
  AppTab get tab => AppTab.market;

  @override
  Widget get tabPage => const MarketPage();


}
