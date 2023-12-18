import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/search/vm_search_line.dart';

class InputSearchInfoWidgetHome extends StatelessWidget {
  const InputSearchInfoWidgetHome({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<SearchLineViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "출발지".text.size(AppSizes.textFieldTitleSize).black.bold.make(),
        height5,
        TextField(
          controller: viewModel.startController,
          keyboardType: TextInputType.text,
          decoration:
          TextFieldInputDecoration().getDefaultInputDecoration("출발지 입력"),
        ),
        height10,
        "도착지".text.size(AppSizes.textFieldTitleSize).black.bold.make(),
        height5,
        TextField(
          controller: viewModel.destinationController,
          keyboardType: TextInputType.text,
          decoration:
          TextFieldInputDecoration().getDefaultInputDecoration("도착지 입력"),
        ),
        height10,
        DefaultButtonWidget(
            title: "찾기",
            callback: () {
              viewModel.getSearchLineList();
            })
      ],
    );
  }
}

