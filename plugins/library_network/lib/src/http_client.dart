import 'package:dio/dio.dart';

final HttpClient httpClient = HttpClient();

class HttpClient {

  static late Dio _dio;

  void init(String host) {
    _dio = Dio();
  }

  void getHttp() async {
    final response = await _dio.get('https://dart.dev');
    print(response);
  }

  void request() async {
    Response response;
    response = await _dio.get('/test?id=12&name=dio');
    print(response.data.toString());
    // The below request is the same as above.
    response = await _dio.get(
      '/test',
      queryParameters: {'id': 12, 'name': 'dio'},
    );
    print(response.data.toString());
  }


  static Future<Response<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.get(url,
      queryParameters: queryParameters,
      // cancelToken: req.cancelToken,
      // options: Options(
      //   headers: req.headers(),
      // )
    );
  }
}

