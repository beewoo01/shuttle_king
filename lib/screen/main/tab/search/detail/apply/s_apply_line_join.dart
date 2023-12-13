import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/add/s_add_boarding_location.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/vm_apply_line.dart';

import '../../../../../../common/common.dart';
import 'operation/s_setting_operation.dart';
import 'w_apply_line_info.dart';
import 'w_apply_select_location.dart';

class ApplyLineJoinScreen extends StatefulWidget {
  const ApplyLineJoinScreen({
    super.key,
    required this.lineIdx,
  });

  final int lineIdx;

  @override
  State<ApplyLineJoinScreen> createState() => _ApplyLineJoinScreenState();
}

class _ApplyLineJoinScreenState extends State<ApplyLineJoinScreen> {
  late final ApplyLineViewModel viewModel;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<ApplyLineViewModel>()) {
      viewModel = Get.put(ApplyLineViewModel());
      viewModel.getBoardingLocationsOfLineDetail(widget.lineIdx);
      viewModel.getBoardingLocations(widget.lineIdx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.defaultBackgroundGreyColor,
        appBar: CustomAppbar().createAppbar(
            "노선번호 ${widget.lineIdx.toString().padLeft(2, '0')}", () {
          Get.back();
        }),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ApplyLineInfo(),
                          height20,
                          const Row(children: [
                            BuildText(
                              title: "탑승 위치 선택",
                              isBold: true,
                              size: 15,
                            ),
                            width5,
                            BuildText(
                              title: "(탑승위치를 선택해주세요.)",
                              size: 10,
                            )
                          ],)
                          ,
                          ApplySelectLocation(
                            lineIdx: widget.lineIdx,
                          )
                        ],
                      ),
                    ),
                  ],
                ).pSymmetric(h: 20, v: 20),
              ).pSymmetric(h: 20),
            ),
            DefaultButtonWidget(
                title: "탑승지 추가",
                callback: () {
                  Get.to(AddBoardingLocation(
                    lineIdx: widget.lineIdx,
                    latitude: viewModel.latitude,
                    longitude: viewModel.longitude,
                  ));
                }).pSymmetric(h: 20, v: 10)
          ],
        ));
  }
}
