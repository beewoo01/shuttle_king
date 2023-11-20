import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/serch/vo/vo_line_detail.dart';

class LineDetailViewModel extends GetxController {
  //var model = LineDetail(line_idx: 0, line_account_idx: 0, line_capacity: null).obs;
  late Rx<LineDetail> model;

  void getLineDetail() {
    model = LineDetail(line_idx: 1,
        line_account_idx: 2,
        line_capacity: 10,
        line_car_type: "봉고",
        line_price: "3000",
        line_destination_address: "부산광역시 사상구 광장로 17",
        line_destination_latitude: "35.163974",
        line_destination_longitude: "128.97883",
        line_createtime: "2023-11-16 16:07:00").obs;
  }
}