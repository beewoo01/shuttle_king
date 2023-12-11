import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:flutter/material.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';
import 'package:shuttle_king/screen/join/vm_join.dart';
import 'package:ssh2/ssh2.dart';
import 'package:path/path.dart' as path;

class JoinRegistrationLicense extends StatefulWidget {
  const JoinRegistrationLicense({
    super.key,
    required this.accountIdx,
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.carType,
    required this.carNum,
    required this.bankAccountNumber,
    required this.bankName,
  });

  final int accountIdx;
  final String id;
  final String email;
  final String password;
  final String name;
  final String phone;
  final String carType;
  final String carNum;
  final String bankAccountNumber;
  final String bankName;

  @override
  State<JoinRegistrationLicense> createState() =>
      _JoinRegistrationLicenseState();
}

class _JoinRegistrationLicenseState extends State<JoinRegistrationLicense> {
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화
  late final JoinViewModel vm = Get.put(JoinViewModel());

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
      body: Stack(
        children: [
          Column(
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
                    if (vm.getLoading()) {
                      return;
                    }

                    if (_image?.path != null) {
                      vm.setLoading(true);
                      print("DefaultButtonWidget");
                      changeImageName("license${widget.accountIdx}");
                    } else {
                      _showSnackbar("면허증 사진을 등록해주세요.");
                    }
                  })
            ],
          ).pSymmetric(h: 29),
          Obx(() => Visibility(
                visible: vm.getLoading(),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.progressBackgroundColor,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              )),
        ],
      ),
    );
  }

  Future<void> changeImageName(String newName) async {
    if (_image != null) {
      String oldPath = _image!.path;
      String directory = path.dirname(oldPath);
      String extension = path.extension(oldPath);
      String newPath = path.join(directory, '$newName$extension');

      // 이미지 파일을 새 경로에 복사하여 이름 변경
      await _image!.saveTo(newPath);

      // 기존 이미지 파일 삭제 (선택사항)
      // await _image.delete();

      // 변경된 파일 경로로 이미지 파일 업데이트
      _image = XFile(newPath);
      sendSFTP(_image!.path);
    }
  }

  void _showSnackbar(String title) {
    context.showSnackbar(title,
        extraButton: Tap(
            onTap: () {
              context.showErrorSnackbar('error');
            },
            child: Container()));
  }

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  Future<void> sendSFTP(String filePath) async {
    var client = SSHClient(
      host: "110.10.174.243",
      port: 22,
      username: "root",
      passwordOrKey: "code4554!",
    );
    try {
      String result = await client.connect() ?? 'Null result';
      if (result == 'session_connected') {
        result = await client.connectSFTP() ?? 'Null result';
        //client.execute(cmd)
        if (result == 'sftp_connected') {
          String defaultPath =
              "/var/lib/tomcat9/webapps/media/shuttleking/license/${widget.accountIdx}";

          String? mkDir = await client.sftpMkdir(defaultPath);

          if (mkDir.isEmptyOrNull) {
            _showSnackbar("운전면허 등록에 실패했습니다.");
            await client.disconnect();
            return;
          }

          if (mkDir == "mkdir_success") {
            await client.sftpUpload(
                  path: filePath,
                  toPath: defaultPath,
                  callback: (progress) async {
                    print(progress);
                  },
                ) ??
                'Upload failed';

            await client.disconnect();

            vm.joinDriver(widget.accountIdx, widget.carType, widget.carNum,
                widget.bankAccountNumber, widget.bankName, _image!.name);
          } else {
            await client.disconnect();
            _showSnackbar("운전면허 등록에 실패했습니다.");
          }
        }
      }
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
