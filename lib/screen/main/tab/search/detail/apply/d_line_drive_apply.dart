import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';

class LineDriveApplyDialog extends StatelessWidget {
  const LineDriveApplyDialog({super.key});

  double get dialogContainerSize => 250;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dialogContainerSize,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          const EmptyExpanded(),
          Expanded(
            flex: 1,
            child: "해당 노선을 운행\n 하시겠습니까?".text.size(18).make(),
          ),
          Expanded(
            child: Row(
              children: [
                width20,
                Expanded(
                  flex: 2,
                  child: DefaultButtonWidget(title: "확인", callback: () {
                    Get.back();
                  }),
                ),
                width20,
                Expanded(
                  flex: 2,
                  child: DefaultButtonWidget(
                      title: "취소",
                      backgroundColor: AppColors.deepGreyColor,
                      callback: () {
                        Get.back();
                      }),
                ),
                width20,
              ],
            ),
          )
        ],
      ),
    );
  }
}
