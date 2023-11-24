import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/passengers/vm_passenger_detail.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/passengers/w_passenger_detail_list_item.dart';

class PassengerDetail extends StatelessWidget {
  const PassengerDetail({super.key, required this.lineIdx});

  final int lineIdx;

  @override
  Widget build(BuildContext context) {
    late PassengerDetailViewModel viewModel;
    if (!Get.isRegistered<PassengerDetailViewModel>()) {
      viewModel = Get.put(PassengerDetailViewModel());
    }
    viewModel.getPassengers(lineIdx);
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar()
          .createAppbar("노선번호 ${lineIdx.toString().padLeft(2, '0')}", () {
        Get.back();
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...viewModel.passengers
                .map((e) => PassengerDetailListItem(passenger: e).pSymmetric(h: 19, v: 10))
          ],
        ),
      ),
    );
  }
}
