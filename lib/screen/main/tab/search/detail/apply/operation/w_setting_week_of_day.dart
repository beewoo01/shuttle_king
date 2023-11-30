import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/vm_setting_operation.dart';

import '../../../../../../../common/common.dart';
import 'w_setting_operation_item.dart';

class SettingWeekOfDayWidget extends StatefulWidget {
  const SettingWeekOfDayWidget({super.key});

  @override
  State<SettingWeekOfDayWidget> createState() => _SettingWeekOfDayWidgetState();
}

class _SettingWeekOfDayWidgetState extends State<SettingWeekOfDayWidget> {
  SettingOperationViewModel viewModel = Get.find<SettingOperationViewModel>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...viewModel.weekOfDayList.map((element) {
          int currentIndex = viewModel.weekOfDayList.indexOf(element);

          return Obx(
            () {
              bool isSelected =
                  viewModel.selectedWeekOfDayList.contains(currentIndex);
              return GestureDetector(
                  onTap: () {
                    if (isSelected) {
                      viewModel.removeSelectedWeekOfDay(currentIndex);
                    } else {
                      viewModel.addSelectedWeekOfDayList(currentIndex);
                    }
                  },
                  child: SettingOperationItemWidget(
                    title: element,
                    backgroundColor:
                        isSelected ? AppColors.mainGreenColor : Colors.white,
                    textColor: isSelected ? Colors.white : AppColors.grey,
                  ));
            },
          );
        })
      ],
    );
  }
}
