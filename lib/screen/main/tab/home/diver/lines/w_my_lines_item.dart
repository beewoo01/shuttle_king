import 'package:flutter/material.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/dto/dto_driver_lines.dart';
import 'package:shuttle_king/screen/main/widget/build_sub_text_line.dart';
import 'package:shuttle_king/screen/main/widget/w_build_address_location.dart';

import '../../../../../../common/common.dart';
import 'vo/vo_my_line.dart';

class MyLinesItem extends StatelessWidget {
  const MyLinesItem({super.key, required this.line});

  //final MyLineVO line;
  final DriverLinesDTO line;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height10,
          buildText("노선번호 ${line.line_idx.toString().padLeft(2, '0')}",
              color: AppColors.mainGreenColor,
              size: AppSizes.appDefaultTextSize),
          height20,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.red,
            iconText: "출발",
            address: line.line_location_address,
          ),
          height5,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.blue,
            iconText: "도착",
            address: line.line_location_destination_address,
          ),
          height20,
          Row(
            children: [
              BuildSubLineText(
                  title: "운행 시작 시간 ", content: ": ${line.line_location_start_time}"),
              width30,
              BuildSubLineText(
                  title: "남은자리수 ",
                  content:
                  ": ${line.line_capacity - line.numOfcurrent}"),
            ],
          )
        ],
      ).pSymmetric(h: 10, v: 10),
    ).pSymmetric(v: 5);
  }


  Widget buildText(String title,
      {Color color = Colors.black, isBold = true, double size = 16}) =>
      title.text
          .color(color)
          .fontWeight(isBold ? FontWeight.bold : FontWeight.normal)
          .size(size)
          .make();
}
