import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/round_button_theme.dart';
import 'package:shuttle_king/common/widget/w_round_button.dart';
import 'package:shuttle_king/screen/dialog/d_message.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_king/screen/main/map/vo_location_model.dart';
import 'package:shuttle_king/screen/main/map/w_default_map.dart';
import 'package:shuttle_king/screen/main/tab/home/vm_home.dart';
import 'package:shuttle_king/screen/main/tab/home/w_home_line_guide.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/w_line_detail_sliding_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';
import '../serch/detail/apply/add/w_boarding_location_map.dart';
import 'lines/s_my_lines.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late HomeViewModel viewModel = Get.put(HomeViewModel());

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<HomeViewModel>()) {
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
            child: FloatingActionButton(onPressed: (){
              Get.to(const MyLines());
            }),
          ),
        ],
      ),
    );
  }
}
