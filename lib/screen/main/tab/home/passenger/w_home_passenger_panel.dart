import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vm/vm_home_passenger.dart';
import 'package:shuttle_king/screen/main/widget/w_build_address_location.dart';

import 'w_home_passenger_panel_location.dart';

class HomePassengerPanel extends StatelessWidget {
  const HomePassengerPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePassengerViewModel viewModel = Get.find<HomePassengerViewModel>();

    return Column(
      children: [
        height20,
        (viewModel.getModel?.driverLineIdx == 0 || viewModel.getModel?.driverLineIdx == null
                ? "현재 매칭된 기사가 없습니다."
                : "현재 탑승 인원 : ${viewModel.getModel?.numOfParticipants ?? 0}")
            .text
            .make(),
        height20,
        HomeLocationPanel(
          iconData: Icons.location_on,
          color: Colors.red,
          iconText: "출발",
          address: viewModel.getModel?.address,
          time: viewModel.getModel?.startTime,
        ),
        height20,
        HomeLocationPanel(
          iconData: Icons.location_on,
          color: Colors.blueAccent,
          iconText: "도착",
          address: viewModel.getModel?.destinationAddress,
          time: viewModel.getModel?.endTime,
        ),
      ],
    );
  }
}
