import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/util/e_user_type.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';
import 'package:shuttle_king/screen/join/s_join_resiste_licens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key, required this.userType});

  final UserType userType;

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  //double get defaultTextSize => 18;

  //double get defaultPaddingHorizontalSize => 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar("회원가입", () {
        Get.back();
      }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height30,
            "아이디".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("아이디를 입력해 주세요."),
            ),
            height20,
            "비밀번호".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("비밀번호를 입력해 주세요."),
            ),
            height20,
            "비밀번호 확인".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("비밀번호를 입력해 주세요."),
            ),
            height20,
            "이름".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              keyboardType: TextInputType.name,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("이름을 입력해 주세요."),
            ),
            height20,
            "이메일".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("이메일을 입력해 주세요."),
            ),
            height20,
            "전화번호".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("'-' 제외하고 숫자만 입력"),
            ),
            Visibility(
                visible: widget.userType == UserType.DRIVER,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height20,
                    "차량종류"
                        .text
                        .black
                        .size(AppSizes.textFieldTitleSize)
                        .bold
                        .make(),
                    height10,
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: TextFieldInputDecoration()
                          .getDefaultInputDecoration("차량종류를 입력해주세요."),
                    ),
                    height20,
                    "차량번호"
                        .text
                        .black
                        .size(AppSizes.textFieldTitleSize)
                        .bold
                        .make(),
                    height10,
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: TextFieldInputDecoration()
                          .getDefaultInputDecoration("차량번호를 입력해주세요."),
                    ),
                    height20,
                    "계좌번호"
                        .text
                        .black
                        .size(AppSizes.textFieldTitleSize)
                        .bold
                        .make(),
                    height10,
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: TextFieldInputDecoration()
                          .getDefaultInputDecoration("계좌번호를 입력해주세요."),
                    ),
                    height20,
                    "은행명"
                        .text
                        .black
                        .size(AppSizes.textFieldTitleSize)
                        .bold
                        .make(),
                    height10,
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: TextFieldInputDecoration()
                          .getDefaultInputDecoration("은행명을 입력해주세요."),
                    ),
                  ],
                )),
            height20,
            DefaultButtonWidget(
              title: "가입하기",
              callback: () {
                if (widget.userType == UserType.DRIVER) {
                  Get.off(() => const JoinRegistrationLicense());
                } else {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return Dialog(
                          child: SimpleAlarmDialog(
                            title: "회원가입을 성공하셨습니다.",
                            callback: () {
                              print("callback");

                              Get.back();
                            },
                          ),
                        );
                      });
                }
              },
            ),
            height30,
          ],
        ).pSymmetric(h: AppSizes.defaultPaddingHorizontalSize),
      ),
    );
  }
}
