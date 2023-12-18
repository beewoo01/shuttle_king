import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/vm_home_driver.dart';

class HomeLineGuide extends StatelessWidget {
  const HomeLineGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final DriverHomeViewModel viewModel = Get.find<DriverHomeViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height30,
        "노선안내".text.size(18).bold.make(),
        height30,
        Obx(() {
          return viewModel.currentDriveLineStr.value.text
              .color(AppColors.grey)
              .make();
        }),
      ],
    );
  }
}
