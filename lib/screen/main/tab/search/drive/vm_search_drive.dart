import 'package:flutter/material.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/vo/vo_search.dart';

class SearchDriveViewModel extends BaseViewModel {
  final TextEditingController startController = TextEditingController();
  final RxList<SearchVO> _searchLineList = <SearchVO>[].obs;

  List<SearchVO> get searchLineList => _searchLineList;

  void getSearchLineList() {
    api.searchDriverLine(startController.text).then((value) {
      List<SearchVO>? list = value?.map((e) {
        return SearchVO(
            lineIdx: e.line_idx,
            startAddress: e.start_address,
            destinationAddress: e.destination_address,
            startTime: e.start_time,
            lineCapacity: e.line_capacity,
            currentPeople: e.currentPeople,
            driverState: e.driverState);
      }).toList();

      _searchLineList.value = list ?? [];
    });
  }
}
