import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/constant/app_colors.dart';
import 'package:shuttle_king/common/constant/app_sizes.dart';


import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/common/widget/w_height_and_width.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/operation/vm_setting_operation.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/operation/w_setting_week_of_day.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/operation/w_textfield_with_sub_text.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/operation/w_timer_picker.dart';
import 'package:velocity_x/velocity_x.dart';

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
    if (!Get.isRegistered<SettingOperationViewModel>()) {
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
        child: Column(
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

            const TimerPicker(title: "출발시간", isStart: true,),
            height20,
            const TimerPicker(title: "도착시간", isStart: false,),
            height20,
            const TextFieldWithSubText(title: "수용인원", hint: '인승',),
            height20,
            const TextFieldWithSubText(title: "차량종류", hint: '대형 버스', hintTextDirection: TextDirection.ltr,),
            height20,
            const TextFieldWithSubText(title: "가격", hint: '원',),
            height20,
            DefaultButtonWidget(title: "참여 신청", callback: (){
              ///TODO 신설 OR 참여신청
              Get.back();
            })

          ],
        ).pSymmetric(h: AppSizes.defaultPaddingHorizontalSize),
      ),
    );
  }


}
