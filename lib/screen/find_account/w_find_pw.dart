import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';
import 'package:shuttle_king/screen/find_account/vm_find_account_info.dart';

class FindPwWidget extends StatelessWidget {
  const FindPwWidget({super.key});

  double get defaultTextSize => 18;

  double get defaultPaddingHorizontalSize => 29;

  @override
  Widget build(BuildContext context) {
    final FindAccountViewModel viewModel = Get.find<FindAccountViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "아이디".text.black.size(defaultTextSize).bold.make(),
        height10,
        TextField(
          controller: viewModel.idController,
          keyboardType: TextInputType.emailAddress,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("아이디를 입력해 주세요."),
        ),
        height20,
        "이메일".text.black.size(defaultTextSize).bold.make(),
        height10,
        TextField(
          controller: viewModel.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("이메일을 입력해 주세요."),
        ),
        height20,
        "이름".text.black.size(defaultTextSize).bold.make(),
        height10,
        TextField(
          controller: viewModel.nameController,
          keyboardType: TextInputType.name,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration("이름을 입력해 주세요."),
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
          title: "비밀번호찾기",
          callback: () {
            viewModel.findPW();
            /*showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: SimpleAlarmDialog(title: "비밀번호는 11111111 입니다.", callback: () {

                      Get.back();
                    },),
                  );
                });*/
          },
        ),
      ],
    );
  }
}
