import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/serch/detail/apply/operation/vm_setting_operation.dart';

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
    print("_SettingWeekOfDayWidgetState build");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...viewModel.weekOfDayList.map((element) {
          /*int currentIndex = viewModel.weekOfDayList.indexOf(element);
          bool isSelected =
          viewModel.selectedWeekOfDayList.contains(currentIndex);*/
          int currentIndex = viewModel.weekOfDayList.indexOf(element);
          bool isSelected =
          viewModel.sampleSelectedWeekOfDayList.contains(currentIndex);
          return /*GestureDetector(
            onTap: () {
              isSelected
                  ? viewModel.selectedWeekOfDayList.remove(currentIndex)
                  : viewModel.selectedWeekOfDayList.add(currentIndex);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: isSelected ? AppColors.deepGreyColor : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.grey, width: 0.5)),
              child: element.text
                  .color(isSelected ? Colors.white : AppColors.grey)
                  .make()
                  .pSymmetric(h: 10, v: 10),
            ),
          );*/

            Obx(() => GestureDetector(
              onTap: () {
                if (viewModel.selectedWeekOfDayList.contains(element)) {
                  //viewModel.selectedWeekOfDayList.remove(currentIndex);
                  viewModel.removeSelectedWeekOfDay(currentIndex);
                } else {
                  //viewModel.selectedWeekOfDayList.add(currentIndex);
                  viewModel.addSelectedWeekOfDayList(currentIndex);
                }
                /*isSelected
                  ? viewModel.sampleSelectedWeekOfDayList.remove(currentIndex)
                  : viewModel.sampleSelectedWeekOfDayList.add(currentIndex);*/
              },
              child:
                  SettingOperationItemWidget(
                    title: element,
                    backgroundColor: viewModel.selectedWeekOfDayList
                        .contains(element) ? AppColors.deepGreyColor : Colors
                        .white,
                    textColor: viewModel.selectedWeekOfDayList
                        .contains(element) ? Colors.white : AppColors.grey,)
/*

                  Container(
                  decoration: BoxDecoration(
                  color: isSelected ? AppColors.deepGreyColor : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.grey, width: 0.5)),
              child: element.text
                  .color(isSelected ? Colors.white : AppColors.grey)
                  .make()
                  .pSymmetric(h: 10, v: 10),
            )*/),
            );
        })
      ],
    );
  }
}
