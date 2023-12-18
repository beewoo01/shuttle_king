import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/search/s_search_line.dart';
import 'package:shuttle_king/screen/main/tab/search/drive/vm_search_drive.dart';
import 'package:shuttle_king/screen/main/tab/search/drive/w_search_line.dart';
import 'package:shuttle_king/screen/main/tab/search/drive/w_search_list_drive.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/vo/w_input_search_info.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/vo/w_search_list.dart';

class SearchDriver extends StatefulWidget {
  const SearchDriver({super.key});

  @override
  State<SearchDriver> createState() => _SearchDriverState();
}

class _SearchDriverState extends State<SearchDriver> {

  late final SearchDriveViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Get.put(SearchDriveViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  SearchLineWidget(
                    callback: () {
                      viewModel.getSearchLineList();
                    },
                  ),
                  height20,
                  const SearchListDrive(),
                  height30
                ],
              ).pSymmetric(h: AppSizes.defaultPaddingHorizontalSize, v: 15),
            )
          ],
        ),
      ),
    );
  }
}
