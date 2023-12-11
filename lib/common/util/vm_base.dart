import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/network/rest_client.dart';

class BaseViewModel extends GetxController {
  late final api = RestClient(Dio());
}