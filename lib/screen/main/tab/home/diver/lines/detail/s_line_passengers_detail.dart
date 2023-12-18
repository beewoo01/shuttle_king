import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/dto/dto_driver_lines.dart';

import '../vo/vo_my_line.dart';
import 'stop/s_operation_stop_apply.dart';
import 'vm_line_detail_with_passengers.dart';
import 'w_line_detail_info.dart';
import 'w_passengers_list.dart';

class LinePassengersDetail extends StatefulWidget {
  const LinePassengersDetail({super.key, required this.line});

  //final MyLineVO line;
  final DriverLinesDTO line;

  @override
  State<LinePassengersDetail> createState() => _LinePassengersDetailState();
}

class _LinePassengersDetailState extends State<LinePassengersDetail> {

  @override
  void initState() {
    super.initState();
    if(!Get.isRegistered<LinePassengersDetailViewModel>()) {
      Get.put(LinePassengersDetailViewModel());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar()
          .createAppbar("노선번호 ${widget.line.line_idx.padLeft(2, "0")}", () {
        Get.back();
      }),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                LineDetailInfo(line: widget.line).pSymmetric(h: 19, v: 10),
                DefaultButtonWidget(title: "운행 중단 신청", callback: (){
                  Get.to(OperationStopApply(lineIdx: widget.line.line_idx));

                }).pSymmetric(h: 19),
                PassengersList(lineIdx: widget.line.line_idx,).pSymmetric(h: 19)

              ],
            ),
          )
        ],
      ),
    );
  }
}
