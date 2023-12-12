import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/map/vo_location_model.dart';
import 'package:shuttle_king/screen/main/map/w_default_map.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/s_my_lines.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/vm_home_driver.dart';
import 'package:shuttle_king/screen/main/tab/home/w_home_line_guide.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeDriver extends StatefulWidget {
  const HomeDriver({super.key});

  @override
  State<HomeDriver> createState() => _HomeDriverState();
}

class _HomeDriverState extends State<HomeDriver> {
  late DriverHomeViewModel viewModel = Get.put(DriverHomeViewModel());

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<DriverHomeViewModel>()) {
      viewModel.getLineDetail();
      viewModel.getBoardingLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.defaultBackgroundGreyColor,
      child: Stack(
        children: [
          DefaultMap(
            latitude: viewModel.model.line_destination_latitude,
            longitude: viewModel.model.line_destination_longitude,
            locationModelList: viewModel.boardingLocationList
                .map((e) => LocationModel(
              idx: e.line_location_idx,
              position: e.line_location_boarding_number,
              latitude: e.line_location_latitude,
              longitude: e.line_location_longitude,
            ))
                .toList(),
          ),
          SlidingUpPanel(
            panel: const HomeLineGuide().pSymmetric(h: 20),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            maxHeight: 350,
          ),
          Positioned(
            right: 20,
            bottom: 50,
            child: FloatingActionButton(
              heroTag: "Move Driver Line",
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
              backgroundColor: AppColors.mainGreenColor,
              onPressed: () {
                Get.to(const MyLines());
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
