import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/screen/main/widget/build_sub_text_line.dart';
import 'package:shuttle_king/screen/main/widget/w_build_address_location.dart';
import 'package:flutter/material.dart';

import 'vo/vo_search_line.dart';

class LineItem extends StatelessWidget {
  final SearchLine line;

  const LineItem(this.line, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText("노선번호 ${line.line_idx.toString().padLeft(2, '0')}",
                  color: AppColors.mainGreenColor,
                  size: AppSizes.appDefaultTextSize),
              buildText("기사매칭",
                  color: line.isMatching ? AppColors.mainGreenColor : AppColors
                      .grey, isBold: false),
            ],
          ),
          height20,

          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.red,
            iconText: "출발",
            address: line.line_start_address,),

          height5,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.blue,
            iconText: "도착",
            address: line.line_destination_address,),

          height20,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuildSubLineText(title: "운행 시작 시간 ", content: ": ${line.start_time}"),
              BuildSubLineText(title: "현재 인원 ", content: ": ${line.current_passangers_count}"),
              BuildSubLineText(title: "남은자리수 ", content: ": ${line.line_capacity - line.current_passangers_count}"),

            ],
          )

        ],
      ).pSymmetric(h: 10, v: 10),
    ).pSymmetric(v: 5);
  }

  Row buildRow(IconData iconData, String text, Color color, String subText) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              iconData,
              color: color,
            ),
            text.text.xs.size(10).color(color).make()
          ],
        ),
        width10,


      ],
    );
  }

  Widget buildText(String title,
      {Color color = Colors.black, isBold = true, double size = 16}) =>
      title.text
          .color(color)
          .fontWeight(isBold ? FontWeight.bold : FontWeight.normal)
          .size(size)
          .make();
}
