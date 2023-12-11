import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/network/rest_client.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';
import 'package:shuttle_king/screen/join/s_join_resiste_licens.dart';

class JoinViewModel extends GetxController {
  late final api = RestClient(Dio());
  final RxBool _isLoading = false.obs;
  final RxBool _isSuccessJoinDriver = false.obs;
  final RxInt _joinState = 0.obs;

  int get joinState => _joinState.value;

  bool get isSuccessJoinDriver => _isSuccessJoinDriver.value;

  void setLoading(bool isLoading) => _isLoading.value = isLoading;

  bool getLoading() => _isLoading.value;

  void joinDriver(int accountIdx, String carType, String carNum,
      String bankAccountNumber, String bankName, String imageName) {
    api
        .joinDriver(
      accountIdx,
      carType,
      carNum,
      bankAccountNumber,
      bankName,
      imageName,
    )
        .then((value) {
      setLoading(false);
      /*setLoading(false);
      _isSuccessJoinDriver.value = value > 0;*/
      if (value > 0) {
        showDialog();
      } else {
        print(value);
        Utils.snackBar("등록 실패", "운전자 등록에 실패했습니다.");
        //._showSnackbar("운전자 등록에 실패하였습니다");
      }
    });
  }

  void joinDriverAccount(
    String id,
    String email,
    String password,
    String name,
    String phone,
    String carType,
    String carNum,
    String bankAccountNumber,
    String bankName,
  ) {
    api.joinDriverAccount(id, email, password, name, phone, carType, carNum,
            bankAccountNumber, bankName)
        .then((value) {
      _joinState.value = value;

      switch (value) {
        case 0:
        case -4:
          {
            Utils.snackBar("회원가입에 실패하였습니다.", "관리자에게 문의해주세요.");
            break;
          }
        case -1:
          {
            Utils.snackBar("이미 등록된 운전자 정보입니다.", "");
            break;
          }

        case -2:
          {
            Utils.snackBar("이미 등록된 아이디입니다.", "다른 아이디를 입력해주세요.");
            break;
          }

        case -3:
          {
            Utils.snackBar("이미 등록된 이메일입니다.","다른 이메일을 입력해주세요.");
            break;
          }

        default:
          {
            Get.off(JoinRegistrationLicense(
              accountIdx: value,
              id: id,
              email: email,
              password: password,
              name: name,
              phone: phone,
              carType: carType,
              carNum: carNum,
              bankAccountNumber: bankAccountNumber,
              bankName: bankName,
            ));

            //_showDialog();
            break;
          }
      }


    });
  }

  void joinAccount(
    String id,
    String email,
    String password,
    String name,
    String phone,
  ) {
    api.joinAccount(id, email, password, name, phone).then((value) {
      switch (value) {
        case -1:
          {
            Utils.snackBar("이미 등록된 아이디 입니다.", "다른 아이디를 입력해주세요.");
            break;
          }

        case -2:
          {
            Utils.snackBar("이미 등록된 이메일 입니다.", "다른 이메일을 입력해주세요.");
            break;
          }

        case 0:
          {
            Utils.snackBar("회원가입에 실패하였습니다.", "관리자에게 문의해주세요.");
            break;
          }

        default:
          {
            //_showDialog();
            showDialog();
            break;
          }
      }
    });
  }

  void showDialog() {
    Get.dialog(Dialog(
      child: SimpleAlarmDialog(
        title: "회원가입을 성공하셨습니다.",
        callback: () {
          Get.back();
        },
      ),
    )).then((value) {
      Get.back();
    });
  }
}
