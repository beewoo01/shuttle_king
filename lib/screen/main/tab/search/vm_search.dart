import 'package:get/get.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/search/vo/vo_search.dart';
import 'package:shuttle_king/screen/main/tab/search/vo/vo_search_line.dart';

import 'vo/dummy_search_lines.dart';

class SearchViewModel extends BaseViewModel {
  final RxList<SearchVO> _searchLineList = <SearchVO>[].obs;

  List<SearchVO> get searchLineList => _searchLineList;
  final RxString _startAddress = "".obs;
  final RxString _destinationAddress = "".obs;

  void setStartAddress(String startAddress) =>
      _startAddress.value = startAddress;

  void setDestinationAddress(String destinationAddress) =>
      _destinationAddress.value = destinationAddress;

  void getSearchLineList() {

    api.searchLine(_startAddress.value, _destinationAddress.value).then((value) {
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
