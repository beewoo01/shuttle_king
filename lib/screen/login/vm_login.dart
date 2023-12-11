import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/app.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/util/vm_base.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  void login() {
    String id = idController.text;
    String pw = pwController.text;
    /*if (id.isEmpty || pw.isEmpty) {
      Utils.snackBar("로그인에 실패했습니다.", "아이디와 비밀번호를 확인해 주세요.");
      return;
    }*/

    id = "test1";
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
        Utils.snackBar("로그인에 실패했습니다.", "로그인 정보가 일치하지 않습니다.");
      }
    });
  }

}