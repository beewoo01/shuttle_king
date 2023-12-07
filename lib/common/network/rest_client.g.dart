part of 'rest_client.dart';

class _RestClient implements RestClient {
  _RestClient(
      this._dio, {
        this.baseUrl,
      }) {
    //baseUrl ??= 'http://192.168.0.137:8080/project';
    baseUrl ??= 'http://codebrosdev.cafe24.com:8080/motocycle';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<String> sample() async {
    const _extra = <String, dynamic>{};
    /*final queryParameters = <String, dynamic>{
      'user_id': user_id,
      'user_password': user_password,
    };*/
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    ).compose(
      _dio.options,
      '/',
      //queryParameters: queryParameters,
      data: _data,
    ).copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    print("sample value");
    print("$value");

    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }


}