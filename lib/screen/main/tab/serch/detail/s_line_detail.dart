import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/main/map/w_nfmap.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/s_apply_line_join.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/vm_line_detail.dart';

import 'w_bottom_sheet.dart';

class LineDetailScreen extends StatefulWidget {
  final int lineIdx;

  const LineDetailScreen({super.key, required this.lineIdx});

  @override
  State<LineDetailScreen> createState() => _LineDetailScreenState();
}

class _LineDetailScreenState extends State<LineDetailScreen> {
  LineDetailViewModel viewModel = Get.put(LineDetailViewModel());

  @override
  void initState() {
    super.initState();
    viewModel.getLineDetail();
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
          FNMapPage(
            latitude: double.parse(model.line_destination_latitude),
            longitude: double.parse(model.line_destination_longitude),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.9,
            initialChildSize: 0.3,
            minChildSize: 0.1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height30,
                      Center(
                        child:
                            "현재 인원 : ${6}".text.bold.color(Colors.grey).make(),
                      ),
                      height20,
                      "노선안내".text.black.bold.make(),
                      height10,
                      "별관(출발지) - 사상로 01 - 사상로 02 - 사상로 03 - 사상로04 (도착지) "
                          .text
                          .make(),
                      height20,
                      "운행 주기".text.black.bold.make(),
                      height10,
                      "주 2회 (월, 화)".text.make(),
                      height20,
                      DefaultButtonWidget(title: "노선 참여 신청", callback: () {
                            Get.to(ApplyLineJoinScreen(
                              lineIdx: widget.lineIdx,
                            ));
                          })
                    ],
                  ).pSymmetric(h: 20),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
