import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/map/w_nfmap.dart';

import 'w_boarding_location_map.dart';

class AddBoardingLocation extends StatefulWidget {
  const AddBoardingLocation(
      {super.key,
      required this.lineIdx,
      required this.latitude,
      required this.longitude});

  final int lineIdx;
  final double latitude;
  final double longitude;

  @override
  State<AddBoardingLocation> createState() => _AddBoardingLocationState();
}

class _AddBoardingLocationState extends State<AddBoardingLocation> {
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
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: BoardingLocationMapWidget(
              latitude: widget.latitude,
              longitude: widget.longitude,
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: FloatingActionButton(onPressed: () {

            }),
          ),
        ],
      ),
    );
  }
}
