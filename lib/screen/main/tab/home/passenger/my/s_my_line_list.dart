import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/my/vm_my_line_list.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/my/w_my_line_list_item.dart';

class MyLineList extends StatelessWidget {
  const MyLineList({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyLineList build");
    MyLineListViewModel viewModel = Get.put(MyLineListViewModel());
    viewModel.getMyLineList();

    return Scaffold(
      appBar: CustomAppbar().createAppbar("내 노선 목록", () {
        Get.back();
      }),
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...viewModel.myLineList.map((element) => GestureDetector(
                onTap: () {

                },
                child: MyLineListItem(model: element).pSymmetric(h: 20, v: 10)))
          ],
        ),
      ),
    );
  }
}
