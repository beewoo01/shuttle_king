import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/check.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/s_setting_operation.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/vm_apply_line.dart';

import 'w_boarding_location_item.dart';

class ApplySelectLocation extends StatefulWidget {
  const ApplySelectLocation({super.key, required this.lineIdx});

  final int lineIdx;

  @override
  State<ApplySelectLocation> createState() => _ApplySelectLocationState();
}

class _ApplySelectLocationState extends State<ApplySelectLocation> {
  late final viewModel = Get.find<ApplyLineViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          ...viewModel.list.mapIndexed((currentValue, index) => GestureDetector(
                onTap: () {
                  Get.off(SettingOperation(
                    lineIdx: widget.lineIdx,
                    locationIdx: currentValue.locationIdx,
                    locationState: 0,
                  ));
                },
                child: Obx(() => BoardingLocationItemWidget(
                      boardingLocation: currentValue,
                      isSelected: viewModel.selectedPosition == index,
                      index: viewModel.list.length - 1 == index ? -2 : index,
                    )),
              ))
        ],
      );
    });
  }
}
