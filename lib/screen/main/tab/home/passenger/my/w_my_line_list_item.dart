import 'package:flutter/material.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/my/vo/vo_my_line.dart';
import 'package:shuttle_king/screen/main/widget/build_sub_text_line.dart';
import 'package:shuttle_king/screen/main/widget/w_build_address_location.dart';

import '../../../../../../common/common.dart';

class MyLineListItem extends StatelessWidget {
  const MyLineListItem({super.key, required this.model});

  final MyLineVO model;


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
              buildText("노선번호 ${model.lineIdx.toString().padLeft(2, '0')}",
                  color: AppColors.mainGreenColor,
                  size: AppSizes.appDefaultTextSize),
              buildText(model.driverPhoneNum ?? "", color: Colors.black, isBold: false),
            ],
          ),
          height20,

          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.red,
            iconText: "출발",
            address: model.startAddress,),

          height5,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.blue,
            iconText: "도착",
            address: model.endAddress,),

          height20,

          BuildSubLineText(title: "운행시간 ", content: ": ${model.startTime}"),
          BuildSubLineText(title: "남은자리수 ", content: ": ${model.passengersCount}"),

        ],
      ).pSymmetric(h: 15, v: 10),
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
