part of 'rest_client.dart';

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    //baseUrl ??= 'http://192.168.0.137:8080/project';
    //baseUrl ??= 'http://codebrosdev.cafe24.com:8080/motocycle';
    baseUrl ??= 'http://192.168.0.140:8080/project/';
  }

  final Dio _dio;

  String? baseUrl;

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

  RequestOptions _createRequestOptionsSync({
    required String method,
    required String path,
    Map<String, dynamic>? extra = const {},
    Map<String, dynamic>? headers = const {},
    Map<String, dynamic>? data = const {},
    Map<String, dynamic>? parameter,
  }) {
    print("_createRequestOptionsSync");

    return Options(
      method: method,
      headers: headers,
      extra: extra,
    )
        .compose(_dio.options, path, data: data, queryParameters: parameter)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl);
  }

  @override
  Future<String> sample() async {
    const _extra = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
      method: 'GET',
      headers: {},
      extra: {},
    )
        .compose(
          _dio.options,
          'test',
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    print("sample value");
    print("$value");

    return value;
  }

  @override
  Future<Map> login(String accountId, String accountPassword) async {
    final option = _createRequestOptionsSync(
        method: 'POST',
        path: 'login',
        parameter: {
          "account_id": accountId,
          "account_password": accountPassword
        });
    final result = await _dio.fetch<Map?>(_setStreamType<Map?>(option));
    print("login");
    print(result.data);

    return result.data!;
  }

  @override
  Future<int> joinAccount(String accountId, String accountEmail,
      String accountPassword, String accountName, String accountPhone) async {
    final option = _createRequestOptionsSync(
        method: 'POST',
        path: "joinAccount",
        parameter: {
          "account_id": accountId,
          "account_email": accountEmail,
          "account_password": accountPassword,
          "account_name": accountName,
          "account_phone": accountPhone,
        });

    final result = await _dio.fetch<int?>(_setStreamType<int?>(option));
    print("joinAccount");
    print(result.data);

    return result.data!;
  }

  @override
  Future<int> joinDriverAccount(
      String accountId,
      String accountEmail,
      String accountPassword,
      String accountName,
      String accountPhone,
      String driverCarType,
      String driverCarNum,
      String driverBankAccountNumber,
      String driverBankName) async {
    final option = _createRequestOptionsSync(
        method: 'POST',
        path: "joinDriverAccount",
        parameter: {
          "account_id": accountId,
          "account_email": accountEmail,
          "account_password": accountPassword,
          "account_name": accountName,
          "account_phone": accountPhone,
          "driver_cartype": driverCarType,
          "driver_carnum": driverCarNum,
          "driver_bank_account_number": driverBankAccountNumber,
          "driver_bank_name": driverBankName,
        });

    final result = await _dio.fetch<int?>(_setStreamType<int?>(option));
    print("joinDriverAccount");
    print(result.data);

    return result.data!;
  }

  @override
  Future<int> joinDriver(
      int driverAccountIdx,
      String driverCarType,
      String driverCarNum,
      String driverBankAccountNumber,
      String driverBankName,
      String driverLicenceImgUrl) async {
    final option = _createRequestOptionsSync(
        method: 'POST',
        path: "joinDriver",
        parameter: {
          "driver_account_idx": driverAccountIdx,
          "driver_cartype": driverCarType,
          "driver_carnum": driverCarNum,
          "driver_bank_account_number": driverBankAccountNumber,
          "driver_bank_name": driverBankName,
          "driver_licent_img_url": driverLicenceImgUrl,
        });

    final result = await _dio.fetch<int?>(_setStreamType<int?>(option));
    print("joinDriver");
    print(result.data);

    return result.data!;
  }
}
