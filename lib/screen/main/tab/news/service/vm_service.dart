import 'package:get/get.dart';

import 'vo_service.dart';

class ServiceViewModel extends GetxController {
  final RxList<ServiceVO> _serviceList = <ServiceVO>[].obs;

  List<ServiceVO> get serviceList => _serviceList;

  void getServiceList() {
    List<ServiceVO> list = [];
    for (int i = 0; i < 30; i++) {
      list.add(ServiceVO(
          serviceIdx: i + 1,
          serviceTitle: "serviceTitle ${i + 1}",
          serviceContent: "serviceContent ${i + 1}",
          serviceCreateTime: "2023.11.10"));
    }
    _serviceList.clear();
    _serviceList.addAll(list);
  }
}
