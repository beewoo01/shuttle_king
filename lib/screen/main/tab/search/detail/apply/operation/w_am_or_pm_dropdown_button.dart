import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/vm_setting_operation.dart';

class DropDownButtonAmOrPmWidget extends StatefulWidget {
  const DropDownButtonAmOrPmWidget({super.key});

  @override
  State<DropDownButtonAmOrPmWidget> createState() =>
      _DropDownButtonAmOrPmWidgetState();
}

class _DropDownButtonAmOrPmWidgetState
    extends State<DropDownButtonAmOrPmWidget> {

  SettingOperationViewModel viewModel = Get.find<SettingOperationViewModel>();

  final _valueList = ["오전", "오후"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.borderGrey, width: 0.5),
          borderRadius:
              BorderRadius.circular(50), //border raiuds of dropdown button
        ),
        child: Obx(() => DropdownButton(
          value: viewModel.startTimePeriod,
          items: _valueList
              .map((e) => DropdownMenuItem(
            value: e,
            child: e.text.make(),
          ))
              .toList(),
          onChanged: (value) {
            viewModel.setStartTimePeriod(value.toString());
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.grey,
          ).pOnly(left: 5),
          iconEnabledColor: Colors.white,
          style: const TextStyle(
              color: Colors.black, //Font color
              fontSize: 13),
          //dropdown background color
          underline: Container(),
          //remove underline
          isExpanded: true, //make true to make width 100%
        )).pSymmetric(h: 10));

  }
}
