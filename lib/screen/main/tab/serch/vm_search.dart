import 'package:shuttle_king/screen/main/tab/serch/vo/vo_search_line.dart';
import 'package:get/get.dart';

import 'vo/dummy_search_lines.dart';

class SearchViewModel extends GetxController {
  List<SearchLine> searchLineList = <SearchLine>[].obs;

  void getSearchLineList() {
    searchLineList = searchLines;
  }
}