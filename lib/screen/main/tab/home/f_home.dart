import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/vm_home_driver.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/w_home_driver.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/w_home_passenger.dart';


class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late DriverHomeViewModel viewModel = Get.put(DriverHomeViewModel());
  int _uniqueHeroTagIndex = 0;

  Singleton singleton = Singleton();

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
    print("singleton.isDriver");
    print(singleton.isDriver);
    if(singleton.isDriver ?? false) {
      print("if(singleton.isDriver ?? false)");
      return const HomeDriver();
    } else {
      print("else");
      return const HomePassenger();
    }

    /*Container(
      color: AppColors.defaultBackgroundGreyColor,
      child: Stack(
        children: [
          DefaultMap(
            latitude: viewModel.model.line_destination_latitude,
            longitude: viewModel.model.line_destination_longitude,
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
            panel: const HomeLineGuide().pSymmetric(h: 20),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            maxHeight: 350,
          ),
          Positioned(
            right: 20,
            bottom: 50,
            child: FloatingActionButton(
              heroTag: "Move My Line ${_uniqueHeroTagIndex++}",
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
    );*/
  }
}
