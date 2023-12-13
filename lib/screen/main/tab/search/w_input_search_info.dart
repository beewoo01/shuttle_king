import 'package:get/get.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_king/screen/main/tab/search/vm_search.dart';

import '../../../../common/common.dart';

class InputSearchInfoWidget extends StatelessWidget {
  const InputSearchInfoWidget({super.key, required this.callback});

  final VoidCallback callback;


  @override
  Widget build(BuildContext context) {
    late final viewModel = Get.find<SearchViewModel>();
    final TextEditingController startController = TextEditingController();
    final TextEditingController destinationController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "출발지".text.size(AppSizes.textFieldTitleSize).black.bold.make(),
        height5,
        TextField(
          controller: startController,
          keyboardType: TextInputType.text,
          decoration:
              TextFieldInputDecoration().getDefaultInputDecoration("출발지 입력"),
        ),
        height10,
        "도착지".text.size(AppSizes.textFieldTitleSize).black.bold.make(),
        height5,
        TextField(
          controller: destinationController,
          keyboardType: TextInputType.text,
          decoration:
              TextFieldInputDecoration().getDefaultInputDecoration("도착지 입력"),
        ),
        height10,
        DefaultButtonWidget(
            title: "찾기",
            callback: () {
              viewModel.setStartAddress(startController.text);
              viewModel.setDestinationAddress(destinationController.text);
              callback();
            })
      ],
    );
  }
}
