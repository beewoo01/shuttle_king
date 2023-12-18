import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';
import 'package:shuttle_king/screen/dialog/d_next_or_cancel.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/apply/add/vm_add_boarding_location.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/apply/operation/s_setting_operation.dart';

import 'w_boarding_location_map.dart';

class AddBoardingLocation extends StatefulWidget {
  const AddBoardingLocation(
      {super.key,
      this.lineIdx,
      required this.latitude,
      required this.longitude});

  final int? lineIdx;
  final double latitude;
  final double longitude;

  @override
  State<AddBoardingLocation> createState() => _AddBoardingLocationState();
}

class _AddBoardingLocationState extends State<AddBoardingLocation> {
  late AddBoardingLocationViewModel viewModel;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<AddBoardingLocationViewModel>()) {
      viewModel = Get.put(AddBoardingLocationViewModel());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar(
          widget.lineIdx != null
              ? "노선번호 ${widget.lineIdx.toString().padLeft(2, '0')}"
              : "노선 신설", () {

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
            child: FloatingActionButton(
              onPressed: () {
                if (viewModel.startAddress.isEmpty ||
                    viewModel.destinationAddress.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: SimpleAlarmDialog(
                            title: "출발, 도착 위치를 지정해 주세요.",
                            callback: () {

                            },
                          ),
                        );
                      });
                  return;
                }

                setDialog();
              },
              shape: const CircleBorder(),
              backgroundColor: AppColors.mainGreenColor,
              child: Image.asset("$basePath/icon/apply_fab_icon.png"),
            ),
          ),
        ],
      ),
    );
  }

  void setDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: NextOrCancelDialogWidget(
                title: "해당 위치로 노선을\n신설 하시겠습니까?",
                confirmCallback: () {
                  Get.off(() => SettingOperation(
                        lineIdx: widget.lineIdx,
                        locationState: widget.lineIdx != null ? 1 : 2,
                        startLatitude: viewModel.startLatitude.value,
                        startLongitude: viewModel.startLongitude.value,
                        destinationLatitude:
                            viewModel.destinationLatitude.value,
                        destinationLongitude:
                            viewModel.destinationLongitude.value,
                        startAddress: viewModel.startAddress.value,
                        destinationAddress: viewModel.destinationAddress.value,
                      ));
                }),
          );
        });
  }
}
