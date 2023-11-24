import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/w_passengers_list_item.dart';

import 'passengers/w_passengers_detail.dart';
import 'vm_line_detail_with_passengers.dart';

class PassengersList extends StatelessWidget {
  const PassengersList({super.key, required this.lineIdx});

  final int lineIdx;

  @override
  Widget build(BuildContext context) {
    final LinePassengersDetailViewModel viewModel =
        Get.find<LinePassengersDetailViewModel>();

    viewModel.getPassengers(lineIdx);

    return Column(
      children: [
        height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BuildText(
              title: "탑승자 목록",
              isBold: true,
              size: 16,
            ),
            TextButton(
                onPressed: () {
                  Get.to(PassengerDetail(lineIdx: lineIdx,));
                },
                child: "상세보기".text.color(AppColors.darkGrey).underline.make()),
          ],
        ),
        ...viewModel.passengers
            .map((element) => PassengersListItem(passenger: element))
      ],
    );
  }
}
