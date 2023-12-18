import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/apply/vm_apply_line.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/apply/vo/vo_line_detail_info.dart';

import '../../../../../../../common/common.dart';



class ApplyLineInfo extends StatelessWidget {
  const ApplyLineInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ApplyLineViewModel viewModel = Get.find<ApplyLineViewModel>();
    return Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BuildText(
              title: "출발지",
              isBold: true,
              size: 15,
            ),
            height5,
            BuildText(
              title: viewModel.model?.lineLocationAddress ?? "",
              size: 16,
            ),
            height20,
            const BuildText(
              title: "도착지",
              isBold: true,
              size: 15,
            ),
            height5,
            BuildText(title: viewModel.model?.lineDestinationAddress ?? "", size: 15),
            height20,
            const BuildText(
              title: "운행시간",
              isBold: true,
              size: 15,
            ),
            height5,
            BuildText(title: viewModel.model?.lineLocationStartTime ?? "", size: 15),
            height20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BuildText(
                        title: "현재인원",
                        isBold: true,
                        size: 15,
                      ),
                      height5,
                      BuildText(title: "${viewModel.model?.currentPassengerCount ?? ""}", size: 15),
                    ],
                  ),
                ),
                width30,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BuildText(
                        title: "남은자리수",
                        isBold: true,
                        size: 15,
                      ),
                      height5,
                      BuildText(
                          title:
                              "${(viewModel.model?.lineCapacity ?? 0) - (viewModel.model?.currentPassengerCount ?? 0)}",
                          size: 15),
                    ],
                  ),
                )
              ],
            ),
            height20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BuildText(
                        title: "운행 주기",
                        isBold: true,
                        size: 15,
                      ),
                      height5,
                      BuildText(title: "${viewModel.model?.operationDays}", size: 15),
                    ],
                  ),
                ),
                width30,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BuildText(
                        title: "차량종류",
                        isBold: true,
                        size: 15,
                      ),
                      height5,
                      BuildText(title: (viewModel.model?.lineCarType) ?? "", size: 15),
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      }
    );
  }
}
