import 'package:shuttle_king/common/constant/app_sizes.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:flutter/material.dart';

import '../../../../common/common.dart';

class InputSearchInfoWidget extends StatelessWidget {
  const InputSearchInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "출발지".text.size(AppSizes.textFieldTitleSize).black.bold.make(),
        height5,
        TextField(
          keyboardType: TextInputType.text,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("출발지 입력"),
        ),
        height10,

        "도착지".text.size(AppSizes.textFieldTitleSize).black.bold.make(),
        height5,
        TextField(
          keyboardType: TextInputType.text,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("도착지 입력"),
        ),
        height10,
        DefaultButtonWidget(title: "찾기", callback: (){

        })
      ],
    );
  }
}
