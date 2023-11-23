import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/s_apply_line_join.dart';

import '../../../../../../common/common.dart';

class LineDetailSlidingPanel extends StatelessWidget {
  const LineDetailSlidingPanel({super.key, required this.lineIdx});
  final int lineIdx;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height30,
        Center(
          child:
          "현재 인원 : ${6}".text.bold.color(Colors.grey).make(),
        ),
        height20,
        "노선안내".text.black.bold.make(),
        height10,
        "별관(출발지) - 사상로 01 - 사상로 02 - 사상로 03 - 사상로04 (도착지) "
            .text
            .make(),
        height20,
        "운행 주기".text.black.bold.make(),
        height10,
        "주 2회 (월, 화)".text.make(),
        height20,
        DefaultButtonWidget(title: "노선 참여 신청", callback: () {
          Get.to(ApplyLineJoinScreen(
            lineIdx: lineIdx,
          ));
        })
      ],
    );
  }
}
