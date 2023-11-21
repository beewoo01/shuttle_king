import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/operation/vm_setting_operation.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/operation/w_setting_week_of_day.dart';

class SettingOperation extends StatefulWidget {
  const SettingOperation({super.key, required this.lineIdx});

  final int lineIdx;

  @override
  State<SettingOperation> createState() => _SettingOperationState();
}

class _SettingOperationState extends State<SettingOperation> {
  
  @override
  void initState() {
    super.initState();
    print("SettingOperation initState");
    if(!Get.isRegistered<SettingOperationViewModel>()) {
      print("SettingOperation !Get.isRegistered<SettingOperationViewModel>");
      Get.put(SettingOperationViewModel());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar(
          "노선번호 ${widget.lineIdx.toString().padLeft(2, '0')}", () {
        Get.back();
      }),
      body: SingleChildScrollView(
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height10,
            BuildText(
              title: "운행요일",
              isBold: true,
            ),
            height5,
            SettingWeekOfDayWidget()

          ],
        ).pSymmetric(h: AppSizes.defaultPaddingHorizontalSize),
      ),
    );
  }
}
