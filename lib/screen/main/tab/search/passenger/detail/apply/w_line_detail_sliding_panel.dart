import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/apply/d_line_drive_apply.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/apply/s_apply_line_join.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/vm_line_detail.dart';

class LineDetailSlidingPanel extends StatelessWidget {
  const LineDetailSlidingPanel(
      {super.key, required this.lineIdx, required this.state});

  final int lineIdx;
  final int state;

  @override
  Widget build(BuildContext context) {
    LineDetailViewModel viewModel = Get.find<LineDetailViewModel>();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height30,
          Center(
            child: "현재 인원 : ${viewModel.lineInfoVO?.currentPassenger ?? 0}"
                .text
                .bold
                .color(Colors.grey)
                .make(),
          ),
          height20,
          "노선안내".text.black.bold.make(),
          height10,
          (viewModel.lineInfoVO?.lineList ?? "").text.make(),
          height20,
          "운행 주기".text.black.bold.make(),
          height10,
          (viewModel.lineInfoVO?.operationDays ?? "").text.make(),
          height20,
          DefaultButtonWidget(
              title: Singleton().isDriver ?? false ? "컨택" : "노선 참여 신청",
              callback: () {
                if (Singleton().isDriver ?? false) {
                  print("state");
                  print(state);
                  if (state == 0) {
                    Utils.snackBar("이미 배정된 기사가 있습니다.", "노선 컨택에 실패했습니다.");
                    return;
                  }

                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: LineDriveApplyDialog(
                            callback: () {
                              viewModel.registerDriverLine(lineIdx);
                            },
                          ),
                        );
                      });
                } else {
                  Get.to(ApplyLineJoinScreen(
                    lineIdx: lineIdx,
                  ));
                }
                Singleton().isDriver ?? false
                    ? showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: LineDriveApplyDialog(
                              callback: () {
                                if (state == 0) {
                                  viewModel.registerDriverLine(lineIdx);
                                } else {
                                  Utils.snackBar(
                                      "이미 배정된 기사가 있습니다.", "노선 컨택에 실패했습니다.");
                                }
                              },
                            ),
                          );
                        })
                    : Get.to(ApplyLineJoinScreen(
                        lineIdx: lineIdx,
                      ));
              })
        ],
      );
    });
  }

  List<String> setWeekOfDay(String str) {
    List<String> daysList = str.split(",");
    Map<String, String> dayMap = {
      '1': '월',
      '2': '화',
      '3': '수',
      '4': '목',
      '5': '금',
      '6': '토',
      '7': '일',
    };

    List<String> convertedDays = daysList.map((day) {
      return dayMap[day] ?? '유효하지 않은 값';
    }).toList();

    print(convertedDays);
    //return convertedDays.join(',');
    return convertedDays;
  }
}
