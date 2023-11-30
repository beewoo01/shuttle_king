
import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/search/vo/vo_search_line.dart';


import 'vo/dummy_search_lines.dart';

class SearchViewModel extends GetxController {
  List<SearchLineVO> searchLineList = <SearchLineVO>[].obs;

  void getSearchLineList() {
    searchLineList = searchLines;
  }
}