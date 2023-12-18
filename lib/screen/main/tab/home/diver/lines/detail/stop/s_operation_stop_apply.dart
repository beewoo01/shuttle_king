import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/stop/vm_operation_stop_apply.dart';

class OperationStopApply extends StatelessWidget {
  const OperationStopApply({
    super.key,
    required this.lineIdx,
  });

  final int lineIdx;

  @override
  Widget build(BuildContext context) {
    OperationStopApplyViewModel viewModel =
    Get.put(OperationStopApplyViewModel());

    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar("운행 중단 신청", () {
        Get.back();
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height10,
          "운행 중단 사유".text
              .size(16)
              .bold
              .make(),
          height10,
          SizedBox(
            height: 200,
            child: TextField(
              controller: viewModel.reasonController,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                hintText: "사유를 입력해주세요.",
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(color: AppColors.borderGrey),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: AppColors.borderGrey),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: AppColors.borderGrey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ),
          height30,
          DefaultButtonWidget(title: "운행 중단 신청", callback: () {
            viewModel.applyLineStopDriver(lineIdx);
          })
        ],
      ).pSymmetric(h: 20),
    );
  }
}
