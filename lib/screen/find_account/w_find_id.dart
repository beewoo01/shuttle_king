import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/widget/util/d_textfield_inputdecoration.dart';

class FindIdWidget extends StatelessWidget {
  const FindIdWidget({super.key});

  double get defaultTextSize => 18;
  double get defaultPaddingHorizontalSize => 29;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "이메일".text.black.size(defaultTextSize).bold.make(),
        height10,
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("계좌번호를 입력해주세요."),
        ),
        height20,
        "이름".text.black.size(defaultTextSize).bold.make(),
        height10,
        TextField(
          keyboardType: TextInputType.name,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("이름을 입력해주세요."),
        ),
        height20,
        "전화번호".text.black.size(defaultTextSize).bold.make(),
        height10,
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("'-' 제외하고 숫자만 입력"),
        ),

        height20,
        DefaultButtonWidget(
          title: "아이디찾기",
          callback: () {

          },
        ),
      ],
    );
  }
}
