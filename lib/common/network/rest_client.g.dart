part of 'rest_client.dart';

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://codebrosdev.cafe24.com:8080/shuttle_king/';
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

  @override
  Future<String?> findID(String email, String name, String phone) async {
    final option =
        _createRequestOptionsSync(method: 'POST', path: "findID", parameter: {
      "email": email,
      "name": name,
      "phone": phone,
    });

    final result = await _dio.fetch<String?>(_setStreamType<String?>(option));

    return result.data;
  }

  @override
  Future<String?> findPW(
      String id, String email, String name, String phone) async {
    final option =
        _createRequestOptionsSync(method: 'POST', path: "findPW", parameter: {
      "id": id,
      "email": email,
      "name": name,
      "phone": phone,
    });

    final result = await _dio.fetch<String?>(_setStreamType<String?>(option));

    return result.data;
  }

  @override
  Future<List<NoticeDTO>?> getNotice() async {
    print("getNotice1");
    final option = _createRequestOptionsSync(method: 'GET', path: "getNotice");
    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));

    return result.data?.map((e) {
      return NoticeDTO.fromJson(e);
    }).toList();
  }

  @override
  Future<List<EventDTO>?> getEvent() async {
    final option = _createRequestOptionsSync(method: 'GET', path: "getEvent");
    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));

    return result.data?.map((e) {
      return EventDTO.fromJson(e);
    }).toList();
  }

  @override
  Future<List<ServiceDTO>?> getMyQnA(int accountIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getMyQnA",
        parameter: {"account_idx": accountIdx});

    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));
    print("getMyQnA");
    print(result.data);
    return result.data?.map((e) {
      return ServiceDTO.fromJson(e);
    }).toList();
  }

  @override
  Future<PassengerCurrentLineDTO?> passengerHome(int accountIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "passengerHome",
        parameter: {"account_idx": accountIdx});

    final result = await _dio.fetch<dynamic>(_setStreamType<dynamic>(option));

    if (result.data == "") {
      return null;
    } else {
      return PassengerCurrentLineDTO.fromJson(result.data);
    }
  }

  @override
  Future<List<MarkerLocationDTO>?> getMarkers(int lineIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET', path: "getMarkers", parameter: {"line_idx": lineIdx});

    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));

    return result.data?.map((e) {
      return MarkerLocationDTO.fromJson(e);
    }).toList();
  }

  @override
  Future<List<MyLineDTO>?> getMyLines(int accountIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getMyLines",
        parameter: {"account_idx": accountIdx});

    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));

    return result.data?.map((e) => MyLineDTO.fromJson(e)).toList();
  }

  @override
  Future<List<SearchDTO>?> searchLine(
      String startAddress, String destinationAddress) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "searchLine",
        parameter: {
          "startAddress": startAddress,
          "destinationAddress": destinationAddress
        });

    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));
    return result.data?.map((e) => SearchDTO.fromJson(e)).toList();
  }

  @override
  Future<LineInfoDTO> getLineInfo(int lineIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET', path: "getLineInfo", parameter: {"line_idx": lineIdx});

    final result = await _dio.fetch<dynamic>(_setStreamType<dynamic>(option));
    return LineInfoDTO.fromJson(result.data);
  }

  @override
  Future<LineDetailInfoDTO> getBoardingLocationsOfLineDetail(
      int lineIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getBoardingLocationsOfLineDetail",
        parameter: {"line_idx": lineIdx});

    final result = await _dio.fetch<dynamic>(_setStreamType<dynamic>(option));
    return LineDetailInfoDTO.fromJson(result.data);
  }

  @override
  Future<List<LineLocationDTO>?> getBoardingLocations(int lineIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getBoardingLocations",
        parameter: {"line_idx": lineIdx});

    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));
    return result.data?.map((e) => LineLocationDTO.fromJson(e)).toList();
  }

  @override
  Future<int?> insertLineLocation(LineLocationDTO model, int accountIdx) async {
    Map<String, dynamic> param = model.toJson();
    param['accountIdx'] = accountIdx;
    final option = _createRequestOptionsSync(
        method: 'POST', path: "insertLineLocation", parameter: param);

    final result = await _dio.fetch<int?>(_setStreamType<int?>(option));

    return result.data;
  }

  @override
  Future<LineAndLocationDTO> getLocation(int locationIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getLocation",
        parameter: {"locationIdx": locationIdx});

    final result = await _dio.fetch<dynamic>(_setStreamType<dynamic>(option));
    return LineAndLocationDTO.fromJson(result.data!);
    //result.data?.map((e) => ).toList();
  }

  @override
  Future<LineAndLocationDTO> getLineInfoForRegisterLocation(int lineIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getLineInfoForRegisterLocation",
        parameter: {"line_idx": lineIdx});

    final result = await _dio.fetch<dynamic>(_setStreamType<dynamic>(option));
    return LineAndLocationDTO.fromJson(result.data!);
  }

  @override
  Future<int> insertLinePassengers(
      int lineIdx, int accountIdx, int locationIdx) async {
    final option = _createRequestOptionsSync(
        method: 'POST',
        path: "insertLinePassengers",
        parameter: {
          "line_idx": lineIdx,
          "account_idx": accountIdx,
          "location_idx": locationIdx,
        });

    final result = await _dio.fetch<int>(_setStreamType<int>(option));
    return result.data!;
  }

  @override
  Future<int?> insertNewLine(LineRegistDTO lineRegistDTO) async {
    Map<String, dynamic> param = lineRegistDTO.toJson();
    final option = _createRequestOptionsSync(
        method: 'POST', path: "insertNewLine", parameter: param);

    final result = await _dio.fetch<int>(_setStreamType<int?>(option));
    return result.data;
  }

  @override
  Future<int?> updateMyInfo(int accountIdx, String accountEmail,
      String accountPassword, String accountPhone) async {
    Map<String, dynamic> param = {
      "account_idx": accountIdx,
      "account_email": accountEmail,
      "account_password": accountPassword,
      "account_phone": accountPhone,
    };

    final option = _createRequestOptionsSync(
        method: 'POST', path: "updateMyInfo", parameter: param);

    final result = await _dio.fetch<int>(_setStreamType<int?>(option));
    return result.data;
  }

  @override
  Future<DriverLineDTO?> getCurrentDriverLine(int accountIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getCurrentDriverLine",
        parameter: {"accountIdx": accountIdx});

    final result = await _dio.fetch<dynamic>(_setStreamType<dynamic>(option));
    print("getCurrentDriverLine");
    print(result.data);
    if (result.data == null || result.data.toString().isEmpty) {
      return null;
    } else {
      return DriverLineDTO.fromJson(result.data);
    }
  }

  @override
  Future<List<DriverLocationMarkerDTO>?> getDriverLocations(int lineIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getDriverLocations",
        parameter: {"lineIdx": lineIdx});

    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));
    print("getDriverLocations");
    print(result.data);
    return result.data?.map((e) {
      return DriverLocationMarkerDTO.fromJson(e);
    }).toList();

    //DriverLocationMarkerDTO.fromJson(result.data!);
  }

  @override
  Future<List<DriverLinesDTO>?> getDriverLineList(int accountIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getDriverLineList",
        parameter: {"accountIdx": accountIdx});

    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));
    print("getDriverLineList");
    print(result.data);
    return result.data?.map((e) {
      return DriverLinesDTO.fromJson(e);
    }).toList();
  }

  @override
  Future<List<LinePassengersDTO>?> getPassengerList(int lineIdx) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "getPassengerList",
        parameter: {"lineIdx": lineIdx});

    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));
    print("getPassengerList");
    print(result.data);
    return result.data?.map((e) {
      return LinePassengersDTO.fromJson(e);
    }).toList();
  }

  @override
  Future<int?> applyLineStopDriver(
      int accountIdx, int lineIdx, String reason) async {
    final option = _createRequestOptionsSync(
        method: 'POST',
        path: "applyLineStopDriver",
        parameter: {
          "accountIdx": accountIdx,
          "lineIdx": lineIdx,
          "reason": reason
        });

    final result = await _dio.fetch<int?>(_setStreamType<int?>(option));
    print("getPassengerList");
    print(result.data);
    return result.data;
  }

  @override
  Future<List<SearchDTO>?> searchDriverLine(String search) async {
    final option = _createRequestOptionsSync(
        method: 'GET',
        path: "searchDriverLine",
        parameter: {
          "search": search,
        });

    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<dynamic>>(option));
    return result.data?.map((e) => SearchDTO.fromJson(e)).toList();
  }

  @override
  Future<int?> registerDriverLine(int accountIdx, int lineIdx) async {
    final option = _createRequestOptionsSync(
        method: 'POST',
        path: "registerDriverLine",
        parameter: {"accountIdx": accountIdx, "lineIdx": lineIdx});

    final result = await _dio.fetch<int?>(_setStreamType<int?>(option));
    print("registerDriverLine");
    print(result.data);
    return result.data;
  }
}
