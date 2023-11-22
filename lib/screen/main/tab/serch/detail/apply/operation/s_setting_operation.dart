import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/operation/vm_setting_operation.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/operation/w_am_or_pm_dropdown_button.dart';
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
    if (!Get.isRegistered<SettingOperationViewModel>()) {
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
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height10,
            const BuildText(
              title: "운행요일",
              isBold: true,
            ),
            height5,
            const SettingWeekOfDayWidget(),
            height20,
            const BuildText(
              title: "출발시간",
              isBold: true,
            ),
            height5,
            Row(
              children: [
                const SizedBox(
                  width: 80,
                  height: 40,
                  child: DropDownButtonAmOrPmWidget(),
                ),
                width20,
                SizedBox(
                  width: 40,
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 1, // 최대 글자 수
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black), // 테두리 색상
                        borderRadius: BorderRadius.circular(8), // 테두리 모양 설정
                      ),
                      counterText: ""
                    ),
                  ),
                )

              ],
            )

          ],
        ).pSymmetric(h: AppSizes.defaultPaddingHorizontalSize),
      ),
    );
  }
}
