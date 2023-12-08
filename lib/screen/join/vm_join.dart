import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/network/rest_client.dart';

class JoinViewModel extends GetxController {
  late final api = RestClient(Dio());
  final RxBool _isLoading = false.obs;
  final RxBool? _isSuccessJoinDriver = null;

  void setLoading(bool isLoading) => _isLoading.value = isLoading;

  void getLoading() => _isLoading.value;

  void joinDriver(String carType, String carNum, String bankAccountNumber,
      String bankName, String imageName) {
    api.joinDriver(
      Singleton().accountIdx!,
      carType,
      carNum,
      bankAccountNumber,
      bankName,
      imageName,).then((value) {
      if (value > 0) {
        _showDialog();
      } else {
        print(value);
        _showSnackbar("운전자 등록에 실패하였습니다");
      }
    });
  }
}
