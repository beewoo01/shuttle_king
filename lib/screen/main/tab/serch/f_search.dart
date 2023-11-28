import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/main/tab/serch/vm_search.dart';
import 'package:shuttle_king/screen/main/tab/serch/w_input_search_info.dart';
import 'package:shuttle_king/screen/main/tab/serch/w_search_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  void initState() {
    super.initState();
    if(!Get.isRegistered<SearchViewModel>()){
      final vm = Get.put(SearchViewModel());
      vm.getSearchLineList();
    }
  }

  double get defaultTextSize => 18;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.defaultBackgroundGreyColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.defaultBackgroundGreyColor,
              title: "노선 목록"
                  .text
                  .fontFamily("TmonMonsori")
                  .color(AppColors.mainGreenColor)
                  .size(20)
                  .make(),
              centerTitle: true,
            ),

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputSearchInfoWidget(callback: (){

                  },),
                  height20,
                  const SearchListWidget(),
                  height30
                ],
              ).pSymmetric(h: AppSizes.defaultPaddingHorizontalSize, v: 15),
            )
          ],
        ));
  }
}
