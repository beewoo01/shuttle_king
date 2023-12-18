import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';

class OperationStopApplyViewModel extends BaseViewModel {
  TextEditingController reasonController = TextEditingController();

  void applyLineStopDriver(int lineIdx) {
    if (reasonController.text.isEmpty) {
      Utils.snackBar("운행중단신청에 실패하였습니다.", "중단 이유를 작성해주세요.");
      return;
    }

    api.applyLineStopDriver(
            Singleton().accountIdx!, lineIdx, reasonController.text)
        .then((value) {
      if ((value ?? 0) > 0) {
        Get.dialog(Dialog(
            child: SimpleAlarmDialog(
          title: "운행중단신청을\n성공하였습니다.",
          callback: () {
            Get.back();
          },
        ))).then((value) {
          Get.back();
        });
      } else {
        Utils.snackBar("운행중단신청에 실패하였습니다.", "관리자에게 문의해주세요.");
      }
    });
  }
}
