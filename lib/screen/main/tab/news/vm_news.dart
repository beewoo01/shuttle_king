import 'package:get/get.dart';

class NewsViewModel extends GetxController {
  final RxInt _currentPosition = 0.obs;
  int get currentPosition => _currentPosition.value;
  void setCurrentPosition(int position) {
    _currentPosition.value = position;
  }
}