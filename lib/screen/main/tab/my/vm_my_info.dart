import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';

class MyInfoViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void updateValidation() {
    if (emailController.text.length < 5) {
      showSnackBar(message: "이메일을 올바르게 입력해주세요.");
    } else if (passwordController.text.length < 4) {
      showSnackBar(message: "비밀번호를 올바르게 입력해주세요.");
    } else if (passwordController.text != passwordConfirmController.text) {
      showSnackBar(message: "비밀번호가 일치하지 않습니다.");
    } else if (phoneController.text.length < 11) {
      showSnackBar(message: "휴대폰번호를 올바르게 입력해주세요.");
    } else {
      updateMyInfo(
          emailController.text, passwordController.text, phoneController.text);
    }
  }

  void showSnackBar(
          {String title = "정보수정에 실패하였습니다.", required String message}) =>
      Utils.snackBar(title, message);

  void updateMyInfo(
    String accountEmail,
    String accountPassword,
    String accountPhone,
  ) {
    api
        .updateMyInfo(Singleton().accountIdx!, accountEmail, accountPassword,
            accountPhone)
        .then((value) {
      switch (value) {
        case 0:
          {
            showSnackBar(message: "관리자에게 문의하세요.");
            break;
          }

        case -1:
          {
            showSnackBar(message: "이미 등록된 이메일이 있습니다.");
            break;
          }

        case -2:
          {
            showSnackBar(message: "이미 등록된 휴대폰번호가 있습니다.");
            break;
          }

        default:
          {
            Get.dialog(Dialog(
                child: SimpleAlarmDialog(
              title: "정보를 수정하였습니다.",
              callback: () {
                for (var element in [
                  emailController,
                  passwordController,
                  passwordConfirmController,
                  phoneController
                ]) {
                  element.text = "";
                }
              },
            ))).then((value) {});
            break;
          }
      }
    });
  }
}
