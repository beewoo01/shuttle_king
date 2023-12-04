import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';

class JoinRegistrationLicense extends StatefulWidget {
  const JoinRegistrationLicense({super.key});

  @override
  State<JoinRegistrationLicense> createState() =>
      _JoinRegistrationLicenseState();
}

class _JoinRegistrationLicenseState extends State<JoinRegistrationLicense> {
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar(
        "회원가입",
        () {
          Get.back();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          "운전면허 등록".text.black.size(18).bold.make(),
          height10,
          Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.borderGrey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  Visibility(
                    visible: _image == null ? true : false,
                    child: GestureDetector(
                      onTap: () {
                        getImage(ImageSource.gallery);
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.add_outlined,
                          size: 40,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _image == null ? false : true,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _image = null;
                        });
                      },
                      child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(_image!.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(),
                      ),
                    ),
                  ),
                ],
              )),
          height30,
          DefaultButtonWidget(
              title: "회원가입",
              callback: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: SimpleAlarmDialog(
                          title: "관리자 승인 후\n이용이 가능합니다.",
                          callback: () {
                            Get.back();
                          },
                        ),
                      );
                    });
              })
        ],
      ).pSymmetric(h: 29),
    );
  }

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }
}
