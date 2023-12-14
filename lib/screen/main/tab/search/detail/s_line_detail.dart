
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/w_map_passanger.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/vm_line_detail.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'apply/w_line_detail_sliding_panel.dart';

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

    viewModel.getLineDetail(widget.lineIdx);
    //viewModel.getBoardingLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar(
          "노선번호 ${widget.lineIdx.toString().padLeft(2, '0')}", () {
        Get.back();
      }),
      body: Stack(
        children: [

          PassengersMap(lineIdx: widget.lineIdx),

          SlidingUpPanel(
            panel: LineDetailSlidingPanel(
              lineIdx: widget.lineIdx,
            ).pSymmetric(h: 20),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            maxHeight: 360,
          )
        ],
      ),
    );
  }
}
