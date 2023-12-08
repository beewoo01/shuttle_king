import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:dio/dio.dart';
import 'package:shuttle_king/app.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/network/rest_client.dart';
import 'package:shuttle_king/common/util/e_user_type.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/screen/dialog/d_message.dart';
import 'package:shuttle_king/screen/find_account/s_find_account_info.dart';
import 'package:shuttle_king/screen/join/d_select_join_status.dart';
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
  late final api = RestClient(Dio());

  double get horizontalPaddingSize => 20;

  double get findAccountTextSize => 14;

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

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
              controller: idController,
              decoration:
                  TextFieldInputDecoration().getDefaultInputDecoration("아이디",
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColors.borderGrey,
                      )),
            ).pSymmetric(v: 10),
            TextField(
              obscureText: true,
              controller: pwController,
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
                //idController.text.toString()
                //pwController.text.toString()
                _login();
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
                    child:
                        "비밀번호찾기".text.size(findAccountTextSize).black.make()),
                "|".text.make(),
                TextButton(
                    onPressed: () {
                      moveJoin();
                    },
                    child: "회원가입".text.size(findAccountTextSize).black.make()),
              ],
            )
          ],
        ).pSymmetric(h: horizontalPaddingSize),
      ),
    );
  }

  void _showSnackbar(String? title) {
    context.showSnackbar(title ?? 'snackbar 입니다.',
        extraButton: Tap(
            onTap: () {
              context.showErrorSnackbar('error');
            },
            child: Container()));
  }

  void _login() {
    String id = idController.text;
    String pw = pwController.text;
    if (id.isEmpty || pw.isEmpty) {
      _showSnackbar("아이디와 비밀번호를 확인해 주세요.");
      return;
    }

    id = "test2";
    pw = "1234";

    api.login(id, pw).then((value) {
      int result = value['result'];
      if (result == 1) {
        //로그인 성공
        Singleton().isDriver = value['account_division'] == 1 ? true : false;
        Singleton().accountIdx = value['account_idx'];
        if (Singleton().accountIdx != null && Singleton().isDriver != null) {
          Get.to(const App());
        }
      } else {
        _showSnackbar("로그인 정보가 일치하지 않습니다.");
      }
    });
  }

  void moveJoin() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: SelectJoinStatus(
              callback: (UserType userType) {
                Get.to(JoinScreen(
                  userType: userType,
                ));
              },
            ),
          );
        });
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    FlutterNativeSplash.remove();
  }
}
