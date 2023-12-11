import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';
import 'package:shuttle_king/screen/find_account/vm_find_account_info.dart';

import '../../common/widget/util/d_textfield_inputdecoration.dart';

class FindIdWidget extends StatelessWidget {
  const FindIdWidget({super.key});

  double get defaultTextSize => 18;

  double get defaultPaddingHorizontalSize => 29;

  //final NewsViewModel viewModel = Get.find<NewsViewModel>();

  @override
  Widget build(BuildContext context) {
    final FindAccountViewModel viewModel = Get.find<FindAccountViewModel>();
    /*final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();*/

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "이메일".text.black.size(defaultTextSize).bold.make(),
        height10,
        TextField(
          controller: viewModel.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("이메일을 입력해주세요."),
        ),
        height20,
        "이름".text.black.size(defaultTextSize).bold.make(),
        height10,
        TextField(
          controller: viewModel.nameController,
          keyboardType: TextInputType.name,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("이름을 입력해주세요."),
        ),
        height20,
        "전화번호".text.black.size(defaultTextSize).bold.make(),
        height10,
        TextField(
          controller: viewModel.phoneController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("'-' 제외하고 숫자만 입력"),
        ),
        height20,
        DefaultButtonWidget(
          title: "아이디찾기",
          callback: () {
            /*if (emailController.text.length < 3) {
              Utils.snackBar("이메일을 정확히 입력해주세요.", "");
              return;
            }

            if (nameController.text.isEmpty) {
              Utils.snackBar("이름을 정확히 입력해주세요.", "");
              return;
            }

            if (phoneController.text.isEmpty) {
              Utils.snackBar("휴대폰번호를 정확히 입력해주세요.", "");
              return;
            }*/

            viewModel.findID();

          },
        ),
      ],
    );
  }
}
