import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/network/rest_client.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';

import '../../common/util/vm_base.dart';

class FindAccountViewModel extends BaseViewModel {
  RxBool isFindingId = true.obs;

  bool get isFindingIdValue => isFindingId.value;

  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void setFindingState(bool isFindingId) {
    this.isFindingId.value = isFindingId;
  }

  void findID() {
    if (emailController.text.length < 3) {
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
    }

    api
        .findID(emailController.text, nameController.text, phoneController.text)
        .then((value) {
      if (value == null) {
        Utils.snackBar("아이디를 찾지 못했습니다.", "입력된 정보와 일치하는 아이디가 없습니다.");
        return;
      }

      showDialog("아이디는 $value 입니다.");
      //아이디는 $value 입니다.
      print("findID");
      print(value);
    });
  }

  void findPW() {
    if (idController.text.length < 3) {
      Utils.snackBar("아이디를 정확히 입력해주세요.", "");
      return;
    }

    if (emailController.text.length < 3) {
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
    }

    api.findPW(idController.text, emailController.text, nameController.text,
            phoneController.text)
        .then((value) {
          if (value == null) {
            Utils.snackBar("비밀번호를 찾지 못했습니다.", "입력된 정보와 일치하는 비밀번호가 없습니다.");
            return;
          }
          print("findPW");
          print(value);
          showDialog("비밀번호는 $value 입니다.");
    });

  }

  void showDialog(String value) {
    Get.dialog(Dialog(
        child: SimpleAlarmDialog(
      title: value,
      callback: () {
        Get.back();
      },
    ))).then((value) {
      Get.back();
    });
  }
}
