import 'dart:collection';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/dto_notice.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://192.168.0.140:8080/project/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('test')
  Future<String> sample();

  @POST("login")
  Future<Map> login(@Body() String accountId, @Body() String accountPassword);

  @POST("joinAccount")
  Future<int> joinAccount(
      @Body() String accountId,
      @Body() String accountEmail,
      @Body() String accountPassword,
      @Body() String accountName,
      @Body() String accountPhone);

  @POST("joinDriverAccount")
  Future<int> joinDriverAccount(
      @Body() String accountId,
      @Body() String accountEmail,
      @Body() String accountPassword,
      @Body() String accountName,
      @Body() String accountPhone,
      @Body() String driverCarType,
      @Body() String driverCarNum,
      @Body() String driverBankAccountNumber,
      @Body() String driverBankName);

  @POST("joinDriver")
  Future<int> joinDriver(
      @Body() int driverAccountIdx,
      @Body() String driverCarType,
      @Body() String driverCarNum,
      @Body() String driverBankAccountNumber,
      @Body() String driverBankName,
      @Body() String driverLicenceImgUrl);

  @POST("findID")
  Future<String?> findID(
      @Body() String email,
      @Body() String name,
      @Body() String phone);

  @POST("findPW")
  Future<String?> findPW(
      @Body() String id,
      @Body() String email,
      @Body() String name,
      @Body() String phone);

  @GET("getNotice")
  Future<List<NoticeDTO>?> getNotice();

}
