import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/constant/app_colors.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/common/widget/w_height_and_width.dart';
import 'package:shuttle_king/common/widget/w_one_text_container.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/apply/operation/w_am_or_pm_dropdown_button.dart';
import 'package:velocity_x/velocity_x.dart';

import 'vm_setting_operation.dart';

class TimerPicker extends StatefulWidget {
  final String title;
  final bool isStart;

  const TimerPicker({
    super.key,
    required this.title,
    required this.isStart,
  });

  @override
  State<TimerPicker> createState() => _TimerPickerState();
}

class _TimerPickerState extends State<TimerPicker> {
  SettingOperationViewModel viewModel = Get.find<SettingOperationViewModel>();

  double get boxSize => 40;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BuildText(
            title: widget.title,
            isBold: true,
          ),
          height5,
          Row(
            children: [
              SizedBox(
                width: 80,
                height: boxSize,
                child: const DropDownButtonAmOrPmWidget(),
              ),
              width20,
              Obx(() => OneTextContainerWidget(
                    title: (widget.isStart
                            ? viewModel.startHour
                            : viewModel.endHour)
                        .padLeft(2, "0")
                        .substring(0, 1),
                    size: boxSize,
                    callback: () async {
                      final TimeOfDay? timeOfDay =
                          await selectedTimeRTL(context);
                      if (timeOfDay != null) {
                        viewModel.setTimeOfDay(timeOfDay, widget.isStart);
                      }
                    },
                  )),
              width5,
              Obx(() => OneTextContainerWidget(
                    title: (widget.isStart
                            ? viewModel.startHour
                            : viewModel.endHour)
                        .padLeft(2, "0")
                        .substring(1, 2),
                    size: boxSize,
                    callback: () async {
                      final TimeOfDay? timeOfDay =
                          await selectedTimeRTL(context);
                      if (timeOfDay != null) {
                        viewModel.setTimeOfDay(timeOfDay, widget.isStart);
                      }
                    },
                  )),
              width5,
              "시".text.bold.black.make(),
              width5,
              Obx(() => OneTextContainerWidget(
                    title: (widget.isStart
                            ? viewModel.startTimeOfDay.minute
                            : viewModel.endTimeOfDay.minute)
                        .padLeft(2, "0")
                        .substring(0, 1),
                    size: boxSize,
                    callback: () async {
                      final TimeOfDay? timeOfDay =
                          await selectedTimeRTL(context);
                      if (timeOfDay != null) {
                        viewModel.setTimeOfDay(timeOfDay, widget.isStart);
                      }
                    },
                  )),
              width5,
              Obx(() => OneTextContainerWidget(
                    title: (widget.isStart
                            ? viewModel.startTimeOfDay.minute
                            : viewModel.endTimeOfDay.minute)
                        .padLeft(2, "0")
                        .substring(1, 2),
                    size: boxSize,
                    callback: () async {
                      final TimeOfDay? timeOfDay =
                          await selectedTimeRTL(context);
                      if (timeOfDay != null) {
                        viewModel.setTimeOfDay(timeOfDay, widget.isStart);
                      }
                    },
                  )),
              width5,
              "분".text.bold.black.make(),
            ],
          )
        ]);
  }

  Future<TimeOfDay?> selectedTimeRTL(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: viewModel.startTimeOfDay,
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
