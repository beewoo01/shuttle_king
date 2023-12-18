import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/search/drive/vm_search_drive.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/s_line_detail.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/vo/w_line_item.dart';

class SearchListDrive extends StatefulWidget {
  const SearchListDrive({super.key});

  @override
  State<SearchListDrive> createState() => _SearchListDriveState();
}

class _SearchListDriveState extends State<SearchListDrive> {
  late final viewModel = Get.find<SearchDriveViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getSearchLineList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          ...viewModel.searchLineList.map((e) => GestureDetector(
              onTap: () {
                Get.to(LineDetailScreen(
                  lineIdx: e.lineIdx,
                    state: e.driverState
                ));
              },
              child: LineItem(e)))
        ],
      );
    });
  }
}
