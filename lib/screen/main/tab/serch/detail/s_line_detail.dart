import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/main/map/vo_location_model.dart';
import 'package:shuttle_king/screen/main/map/w_default_map.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/s_apply_line_join.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/vm_line_detail.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'apply/w_line_detail_sliding_panel.dart';
import 'w_bottom_sheet.dart';

class LineDetailScreen extends StatefulWidget {
  final int lineIdx;

  const LineDetailScreen({super.key, required this.lineIdx});

  @override
  State<LineDetailScreen> createState() => _LineDetailScreenState();
}

class _LineDetailScreenState extends State<LineDetailScreen> {
  late LineDetailViewModel viewModel;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<LineDetailViewModel>()) {
      viewModel = Get.put(LineDetailViewModel());
    }

    viewModel.getLineDetail();
    viewModel.getBoardingLocation();
  }

  @override
  Widget build(BuildContext context) {
    final model = viewModel.model.value;
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar(
          "노선번호 ${widget.lineIdx.toString().padLeft(2, '0')}", () {
        Get.back();
      }),
      body: Stack(
        children: [
          DefaultMap(
            latitude: model.line_destination_latitude,
            longitude: model.line_destination_longitude,
            locationModel: viewModel.boardingLocationList
                .map((e) => LocationModel(
                      idx: e.line_location_idx,
                      title: e.line_location_address,
                      position: e.line_location_boarding_number,
                      latitude: e.line_location_latitude,
                      longitude: e.line_location_longitude,
                    ))
                .toList(),
          ),
          SlidingUpPanel(
            panel: LineDetailSlidingPanel(
              lineIdx: widget.lineIdx,
            ).pSymmetric(h: 20),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            maxHeight: 350,
          )
        ],
      ),
    );
  }
}
