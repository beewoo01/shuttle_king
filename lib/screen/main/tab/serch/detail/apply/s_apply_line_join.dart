import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/add/s_add_boarding_location.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/vm_apply_line.dart';

import '../../../../../../common/common.dart';
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
      viewModel.getBoardingLocation();
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
                child: const CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [ApplyLineInfo(), ApplySelectLocation()],
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
                    latitude: viewModel.list[0].line_location_latitude,
                    longitude: viewModel.list[0].line_location_longitude,
                  ));
                }).pSymmetric(h: 20, v: 10)
          ],
        ));
  }
}
