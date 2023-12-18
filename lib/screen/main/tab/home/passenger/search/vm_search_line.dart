import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/util/vm_base.dart';

import 'package:shuttle_king/screen/main/tab/search/passenger/vo/dummy_search_lines.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/vo/vo_search.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/vo/vo_search_line.dart';


class SearchLineViewModel extends BaseViewModel {
  final RxList<SearchVO> _searchLineList = <SearchVO>[].obs;

  List<SearchVO> get searchLineList => _searchLineList;

  TextEditingController startController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  void getSearchLineList() {
    print("getSearchLineList");
    api.searchLine(startController.text, destinationController.text).then((value) {
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