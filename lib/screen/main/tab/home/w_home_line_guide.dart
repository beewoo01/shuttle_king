import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/home/vm_home.dart';

class HomeLineGuide extends StatelessWidget {
  const HomeLineGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Get.find<HomeViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height30,
        "노선안내".text.size(18).bold.make(),
        height30,
        "별관(출발지) - 사상로 01 - 사송로 02 - 사상로 03 - 사상로 04(도착지)"
            .text
            .color(AppColors.grey)
            .make()
      ],
    );
  }
}
