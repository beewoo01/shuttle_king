import 'package:get/get.dart';

class FindAccountViewModel extends GetxController {
  RxBool isFindingId = true.obs;

  bool get isFindingIdValue => isFindingId.value;

  void setFindingState(bool isFindingId) {
    this.isFindingId.value = isFindingId;
  }

}