import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/search/w_input_search_info.dart';

import 'search/s_search_line.dart';

class HomePassengerSearchPanel extends StatelessWidget {
  const HomePassengerSearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return InputSearchInfoWidget(callback: () {
      print("InputSearchInfoWidget");
      Get.to(const SearchLine());
    },);
  }
}
