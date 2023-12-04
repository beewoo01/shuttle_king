import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:shuttle_king/common/constant/app_colors.dart';

import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/common/widget/w_height_and_width.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/w_textfield_with_sub_text.dart';
import 'package:velocity_x/velocity_x.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar:
          CustomAppbar().createAppbar("내 정보", isShowBackButton: false, () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            height20,
            const TextFieldWithSubText(
              title: "이메일",
              hint: "이메일을 입력해주세요.",
              hintTextDirection: TextDirection.ltr,
              textInputType: TextInputType.emailAddress,
            ),
            height10,
            const TextFieldWithSubText(
              title: "비밀번호",
              hint: "비밀번호를 입력해주세요.",
              hintTextDirection: TextDirection.ltr,
              obscureText: true,
            ),
            height10,
            const TextFieldWithSubText(
              title: "비밀번호 확인",
              hint: "비밀번호를 입력해주세요.",
              hintTextDirection: TextDirection.ltr,
              obscureText: true,
            ),
            height10,
            TextFieldWithSubText(
              title: "전화번호",
              hint: "전화번호를 입력해주세요.",
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              hintTextDirection: TextDirection.ltr,
              textInputType: TextInputType.datetime,
            ),
            height30,
            DefaultButtonWidget(
                title: "수정하기",
                callback: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: SimpleAlarmDialog(
                            title: "수정 완료되었습니다.",
                            callback: () {

                            },
                          ),
                        );
                      });
                }),
            height10,
            DefaultButtonWidget(
                title: "로그아웃",
                backgroundColor: AppColors.deepGreyColor,
                callback: () {
                  Get.back();
                }),
          ],
        ).pSymmetric(h: 29),
      ),
    );
  }
}
