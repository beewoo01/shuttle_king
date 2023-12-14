import 'dart:collection';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/dto/dto_marker_location.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/dto/dto_passenger_current_line.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/my/dto/dto_my_line.dart';
import 'package:shuttle_king/screen/main/tab/news/event/dto_event.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/dto_notice.dart';
import 'package:shuttle_king/screen/main/tab/news/service/dto_service.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/dto/dto_line_detail_info.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/dto/dto_line_location.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/dto/dto_line_and_location.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/dto/dto_line_regist.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/dto/dto_line_info.dart';
import 'package:shuttle_king/screen/main/tab/search/dto/dto_search.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://192.168.0.140:8080/project/')
// @RestApi(baseUrl: 'http://192.168.35.253:8080/project/')
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
      @Body() String email, @Body() String name, @Body() String phone);

  @POST("findPW")
  Future<String?> findPW(@Body() String id, @Body() String email,
      @Body() String name, @Body() String phone);

  @GET("getNotice")
  Future<List<NoticeDTO>?> getNotice();

  @GET("getEvent")
  Future<List<EventDTO>?> getEvent();

  @GET("getMyQnA")
  Future<List<ServiceDTO>?> getMyQnA(@Body() int accountIdx);

  @GET("passengerHome")
  Future<PassengerCurrentLineDTO?> passengerHome(@Body() int accountIdx);

  @GET("getMarkers")
  Future<List<MarkerLocationDTO>?> getMarkers(@Body() int lineIdx);

  @GET("getMyLines")
  Future<List<MyLineDTO>?> getMyLines(@Body() int accountIdx);

  @GET("searchLine")
  Future<List<SearchDTO>?> searchLine(
      String startAddress, String destinationAddress);

  @GET("getLineInfo")
  Future<LineInfoDTO> getLineInfo(int lineIdx);

  @GET("getBoardingLocationsOfLineDetail")
  Future<LineDetailInfoDTO> getBoardingLocationsOfLineDetail(int lineIdx);

  @GET("getBoardingLocations")
  Future<List<LineLocationDTO>?> getBoardingLocations(int lineIdx);

  @POST("insertLineLocation")
  Future<int?> insertLineLocation(@Body() LineLocationDTO model, @Body() int accountIdx);

  @GET("getLocation")
  Future<LineAndLocationDTO> getLocation(int locationIdx);

  @GET("getLineInfoForRegisterLocation")
  Future<LineAndLocationDTO> getLineInfoForRegisterLocation(int lineIdx);

  @POST("insertLinePassengers")
  Future<int> insertLinePassengers(int lineIdx, int accountIdx, int locationIdx);

  @POST("insertNewLine")
  Future<int?> insertNewLine(LineRegistDTO lineRegistDTO);


}
