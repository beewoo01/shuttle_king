import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/search/vm_search_line.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/w_home_passenger_search_panel.dart';
import 'package:shuttle_king/screen/main/tab/search/w_line_item.dart';
import 'package:shuttle_king/screen/main/tab/search/w_search_list.dart';

import '../../../search/detail/s_line_detail.dart';

class SearchLine extends StatelessWidget {
  const SearchLine({super.key});

  @override
  Widget build(BuildContext context) {
    print("SearchLine build");
    SearchLineViewModel viewModel = Get.put(SearchLineViewModel());
    viewModel.getSearchLineList();

    return Scaffold(
      appBar: CustomAppbar().createAppbar('노선 목록', () {
        Get.back();
      }),
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                height20,
                HomePassengerSearchPanel(callback: () {
                  print("HomePassenger Search Panel");
                },).pSymmetric(h: 20, v: 15),
                height20,
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ...viewModel.searchLineList.map((e) => GestureDetector(
                    onTap: () {
                      print("searchLineList item click");
                      Get.to(LineDetailScreen(
                        lineIdx: e.line_idx,
                      ));
                    },
                    child: LineItem(e)))
              ],
            ).pSymmetric(h: 20),
          )
        ],
      ),
    );
  }
}
