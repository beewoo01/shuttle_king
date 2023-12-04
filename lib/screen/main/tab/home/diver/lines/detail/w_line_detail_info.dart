import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/util/formatter.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/vo/vo_my_line.dart';

import 'package:shuttle_king/screen/main/widget/build_sub_text_line.dart';
import 'package:shuttle_king/screen/main/widget/w_build_address_location.dart';

class LineDetailInfo extends StatelessWidget {
  const LineDetailInfo({super.key, required this.line, });
  
  final MyLineVO line;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border:
          Border.all(color: AppColors.borderGrey, width: 0.5),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "노선번호 ${line.line_idx.padLeft(2, "0")}"
              .text
              .color(AppColors.mainGreenColor)
              .size(17)
              .bold
              .make(),
          height20,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.red,
            iconText: "출발",
            address: line.line_start_address,
          ),
          height5,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.blue,
            iconText: "도착",
            address: line.line_destination_address,
          ),
          height20,
          Row(
            children: [
              BuildSubLineText(
                  title: "운행 시작 시간 ",
                  content: ": ${line.start_time}"),
              width30,
              BuildSubLineText(
                  title: "남은자리수 ",
                  content:
                  ": ${line.line_capacity - line.current_passangers_count}"),
            ],
          ),

          height10,
          Row(
            children: [
              "탑승금액 : ".text.bold.color(AppColors.darkGrey).make(),
              line.line_price.formatNumber().text.color(AppColors.darkGrey).make(),
            ],
          ),

          height10,

        ],
      ).pSymmetric(h: 20, v: 10),
    );
  }

  //String formatNumber(int number) => NumberFormat('#,##0').format(number);

}
