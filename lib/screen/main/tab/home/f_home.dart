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
  //late DriverHomeViewModel viewModel = Get.put(DriverHomeViewModel());
  int _uniqueHeroTagIndex = 0;

  Singleton singleton = Singleton();

  @override
  void initState() {
    super.initState();
    /*if (!Get.isRegistered<DriverHomeViewModel>()) {
      viewModel.getLineDetail();
      viewModel.getBoardingLocation();
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return singleton.isDriver ?? false
        ? const HomeDriver()
        : const HomePassenger();
  }
}
