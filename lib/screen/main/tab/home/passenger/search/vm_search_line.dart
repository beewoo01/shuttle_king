import 'package:get/get.dart';

import 'package:shuttle_king/screen/main/tab/search/vo/dummy_search_lines.dart';
import 'package:shuttle_king/screen/main/tab/search/vo/vo_search_line.dart';


class SearchLineViewModel extends GetxController {
  ///TODO LineItem 필참고
  List<SearchLineVO> searchLineList = <SearchLineVO>[].obs;

  void getSearchLineList() {
    searchLineList = searchLines;
  }
}