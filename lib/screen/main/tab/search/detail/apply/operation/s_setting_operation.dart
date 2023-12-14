import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/constant/app_colors.dart';
import 'package:shuttle_king/common/constant/app_sizes.dart';
import 'package:shuttle_king/common/data/singleton.dart';

import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/common/widget/w_height_and_width.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/dto/dto_line_regist.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/vm_setting_operation.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/w_setting_week_of_day.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/w_textfield_with_sub_text.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/w_timer_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingOperation extends StatefulWidget {
  final int? lineIdx;
  final int locationState;

  /*0 -> 참여하기 만 할경우
   * 1 -> 탑승지 재 선택
   * 2 -> 처음 라인 등록
   * */

  final bool isLineRegister;
  final int? locationIdx;
  final double? startLatitude,
      startLongitude,
      destinationLatitude,
      destinationLongitude;

  final String? startAddress, destinationAddress;

  const SettingOperation({
    super.key,
    this.lineIdx,
    this.locationState = 2,
    this.isLineRegister = false,
    this.locationIdx,
    this.startLatitude,
    this.startLongitude,
    this.destinationLatitude,
    this.destinationLongitude,
    this.startAddress,
    this.destinationAddress,
  });

  @override
  State<SettingOperation> createState() => _SettingOperationState();
}

class _SettingOperationState extends State<SettingOperation> {
  late final SettingOperationViewModel viewModel;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<SettingOperationViewModel>()) {
      viewModel = Get.put(SettingOperationViewModel());
      if (widget.locationState == 0) {
        viewModel.getLocation(widget.locationIdx!);
      } else if (widget.locationState == 1) {
        viewModel.getLineInfoForRegisterLocation(widget.lineIdx!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar(
          widget.lineIdx != null
              ? "노선번호 ${widget.lineIdx.toString().padLeft(2, '0')}"
              : "노선 신설", () {
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
            AbsorbPointer(
              absorbing: widget.locationState == 0 || widget.locationState == 1,
              child: const SettingWeekOfDayWidget(),
            ),
            height20,
            AbsorbPointer(
              absorbing: widget.locationState == 0,
              child: const TimerPicker(
                title: "출발시간",
                isStart: true,
              ),
            ),
            height20,
            AbsorbPointer(
              absorbing: widget.locationState == 0,
              child: const TimerPicker(
                title: "도착시간",
                isStart: false,
              ),
            ),
            height20,
            AbsorbPointer(
              absorbing: widget.locationState == 0 || widget.locationState == 1,
              child: TextFieldWithSubText(
                title: "수용인원",
                hint: '인승',
                controller: viewModel.peopleCountController,
                textInputType: TextInputType.datetime,
              ),
            ),
            height20,
            AbsorbPointer(
              absorbing: widget.locationState == 0 || widget.locationState == 1,
              child: TextFieldWithSubText(
                title: "차량종류",
                hint: '대형 버스',
                hintTextDirection: TextDirection.ltr,
                controller: viewModel.kindOfCarController,
              ),
            ),
            height20,
            AbsorbPointer(
              absorbing: widget.locationState == 0 || widget.locationState == 1,
              child: TextFieldWithSubText(
                title: "가격",
                hint: '원',
                controller: viewModel.priceController,
                textInputType: TextInputType.datetime,
              ),
            ),
            height20,
            DefaultButtonWidget(
                title: "참여 신청",
                callback: () {
                  if (widget.locationState == 0) {
                    viewModel.joinPassenger(widget.lineIdx!,
                        Singleton().accountIdx!, widget.locationIdx!);
                  } else if (widget.locationState == 1) {
                    viewModel.joinTheLine(
                        widget.lineIdx!,
                        widget.startLatitude!,
                        widget.startLongitude!,
                        widget.destinationLatitude!,
                        widget.destinationLongitude!,
                        widget.startAddress!,
                        widget.destinationAddress!);
                  } else {

                    viewModel.insertNewLine(
                        widget.startLatitude!,
                        widget.startLongitude!,
                        widget.destinationLatitude!,
                        widget.destinationLongitude!,
                        widget.startAddress!,
                        widget.destinationAddress!
                    );
                  }

                  //Get.back();
                })
          ],
        ).pSymmetric(h: AppSizes.defaultPaddingHorizontalSize),
      ),
    );
  }
}
