import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/vm_base.dart';

import 'vo_service.dart';

class ServiceViewModel extends BaseViewModel {
  final RxList<ServiceVO> _serviceList = <ServiceVO>[].obs;

  List<ServiceVO> get serviceList => _serviceList;
  RxInt selectedItem = (-1).obs;

  void getServiceList() {
    if(Singleton().accountIdx == null) {
      return;
    }

    api.getMyQnA(Singleton().accountIdx!).then((value) {
      List<ServiceVO>? list = value?.map((e) {

        return ServiceVO(
            e.questionAnswerDescription, e.questionAnswerUpdatetime,
            questionIdx: e.questionIdx,
            questionDescription: e.questionDescription,
            questionCreateTime: e.questionCreatetime);
      }).toList();

      _serviceList.value = list ?? [];
    });

    /*List<ServiceVO> list = [];
    for (int i = 0; i < 30; i++) {
      list.add(ServiceVO(
          i + 1,
          "serviceTitle ${i + 1}",
          "serviceContent ${i + 1}\n문의사항$i번째 내용입니다.\n많은 이용 부탁드립니다.",
          serviceCreateTime: "2023.11.10"));
    }
    _serviceList.clear();
    _serviceList.addAll(list);*/
  }
}
