import 'package:dio/dio.dart';

class HttpResponse<T> {

  // 业务层错误码和错误信息
  String? _code;
  String? _msg;
  T? data;

  // 网络层和业务层都成功
  bool get success => true;


  // dio 的 response
  Response? _response;
}
