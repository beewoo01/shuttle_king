import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/screen/main/map/vo_location_model.dart';
import 'package:shuttle_king/screen/main/map/w_default_map.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/my/s_my_line_list.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/search/s_search_line.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vm/vm_home_passenger.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/w_map_passanger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../common/common.dart';
import 'w_home_passenger_panel.dart';
import 'w_home_passenger_search_panel.dart';

class HomePassenger extends StatefulWidget {
  const HomePassenger({super.key});

  @override
  State<HomePassenger> createState() => _HomePassengerState();
}

class _HomePassengerState extends State<HomePassenger> {
  late HomePassengerViewModel viewModel;
  Singleton singleton = Singleton();

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered()) {
      viewModel = Get.put(HomePassengerViewModel());
    }

    if (singleton.accountIdx != null) {
      viewModel.getPassengerLineInfo();
      viewModel.getLocation();
      //viewModel.getMarkers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.defaultBackgroundGreyColor,
      child: Obx(() {
        return Stack(
          children: [
            viewModel.getModel == null
                ? Obx(() => DefaultMap(
                    latitude: viewModel.currentLatitude == 37.3952096
                        ? null
                        : viewModel.currentLatitude,
                    longitude: viewModel.currentLongitude == 127.1120198
                        ? null
                        : viewModel.currentLongitude,
                    locationModelList: null))
                : PassengersMap(lineIdx: viewModel.getModel!.lineIdx),
            SlidingUpPanel(
              panel: viewModel.getModel == null
                  ? HomePassengerSearchPanel(
                      callback: () {
                        Get.to(const SearchLine());
                        //Get.to(const MyLineList());
                      },
                    ).pSymmetric(h: 20, v: 15)
                  : const HomePassengerPanel().pSymmetric(h: 20),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              maxHeight: viewModel.getModel == null ? 300 : 250,
            ),
            Positioned(
              right: 20,
              bottom: 50,
              child: FloatingActionButton(
                heroTag: "Move Passenger Line",
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                backgroundColor: AppColors.mainGreenColor,
                onPressed: () {
                  Get.to(const MyLineList());
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
