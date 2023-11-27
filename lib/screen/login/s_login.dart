import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:shuttle_king/app.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/e_user_type.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/find_account/s_find_account_info.dart';
import 'package:shuttle_king/screen/join/s_join.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {

  double get horizontalPaddingSize => 20;
  double get findAccountTextSize => 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("$basePath/logo_02.png"),
            height30,
            height20,
            TextField(
              decoration:
                  TextFieldInputDecoration().getDefaultInputDecoration("아이디",
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColors.borderGrey,
                      )),
            ).pSymmetric(v: 10),
            TextField(
              decoration:
                  TextFieldInputDecoration().getDefaultInputDecoration("비밀번호",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.borderGrey,
                      )),
            ),
            height10,
            DefaultButtonWidget(
              title: "로그인",
              callback: () {
                Singleton().accountIdx = 1;
                Singleton().isDriver = false;
                Get.to( const App());
                    //const MainScreen());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(const FindAccountInfoScreen());
                    },
                    child: "아이디찾기".text.size(findAccountTextSize).black.make()),
                "|".text.make(),
                TextButton(
                    onPressed: () {
                      Get.to(const FindAccountInfoScreen());
                    },
                    child: "비밀번호찾기".text.size(findAccountTextSize).black.make()),
                "|".text.make(),
                TextButton(
                    onPressed: () {
                      Get.to(const JoinScreen(userType: UserType.DRIVER,));
                    },
                    child: "회원가입".text.size(findAccountTextSize).black.make()),
              ],
            )
          ],
        ).pSymmetric(h: horizontalPaddingSize),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    FlutterNativeSplash.remove();
  }
}
