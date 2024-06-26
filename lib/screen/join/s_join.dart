import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/util/e_user_type.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/text_editing_controller.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuttle_king/screen/join/vm_join.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key, required this.userType});

  final UserType userType;

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  //double get defaultTextSize => 18;

  //double get defaultPaddingHorizontalSize => 29;
  //late final api = RestClient(Dio());

  late final idTextController = TaggedTextFieldController("아이디");
  late final emailTextController = TaggedTextFieldController("이메일");
  late final passwordTextController = TaggedTextFieldController("비밀번호");
  late final passwordConfirmTextController =
      TaggedTextFieldController("비밀번호 확인");
  late final nameTextController = TaggedTextFieldController("이름");
  late final phoneTextController = TaggedTextFieldController("휴대폰 번호");

  late final driverCarTypeTextController = TaggedTextFieldController("차량종류");
  late final driverCarNumTextController = TaggedTextFieldController("차량번호");
  late final driverBankAccountNumberTextController =
      TaggedTextFieldController("계좌번호");
  late final driverBankNameTextController = TaggedTextFieldController("은행명");

  late final JoinViewModel vm;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<JoinViewModel>()) {
      vm = Get.put(JoinViewModel());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar("회원가입", () {
        Get.back();
      }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height30,
            "아이디".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              controller: idTextController,
              keyboardType: TextInputType.emailAddress,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("아이디를 입력해 주세요."),
            ),
            height20,
            "비밀번호".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              controller: passwordTextController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("비밀번호를 입력해 주세요."),
            ),
            height20,
            "비밀번호 확인".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              controller: passwordConfirmTextController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("비밀번호를 입력해 주세요."),
            ),
            height20,
            "이름".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              controller: nameTextController,
              keyboardType: TextInputType.name,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("이름을 입력해 주세요."),
            ),
            height20,
            "이메일".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              controller: emailTextController,
              keyboardType: TextInputType.emailAddress,
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("이메일을 입력해 주세요."),
            ),
            height20,
            "전화번호".text.black.size(AppSizes.textFieldTitleSize).bold.make(),
            height10,
            TextField(
              controller: phoneTextController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: TextFieldInputDecoration()
                  .getDefaultInputDecoration("'-' 제외하고 숫자만 입력"),
            ),
            Visibility(
                visible: widget.userType == UserType.DRIVER,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height20,
                    "차량종류"
                        .text
                        .black
                        .size(AppSizes.textFieldTitleSize)
                        .bold
                        .make(),
                    height10,
                    TextField(
                      controller: driverCarTypeTextController,
                      keyboardType: TextInputType.text,
                      decoration: TextFieldInputDecoration()
                          .getDefaultInputDecoration("차량종류를 입력해주세요."),
                    ),
                    height20,
                    "차량번호"
                        .text
                        .black
                        .size(AppSizes.textFieldTitleSize)
                        .bold
                        .make(),
                    height10,
                    TextField(
                      controller: driverCarNumTextController,
                      keyboardType: TextInputType.text,
                      decoration: TextFieldInputDecoration()
                          .getDefaultInputDecoration("차량번호를 입력해주세요."),
                    ),
                    height20,
                    "계좌번호"
                        .text
                        .black
                        .size(AppSizes.textFieldTitleSize)
                        .bold
                        .make(),
                    height10,
                    TextField(
                      controller: driverBankAccountNumberTextController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: TextFieldInputDecoration()
                          .getDefaultInputDecoration("계좌번호를 입력해주세요."),
                    ),
                    height20,
                    "은행명"
                        .text
                        .black
                        .size(AppSizes.textFieldTitleSize)
                        .bold
                        .make(),
                    height10,
                    TextField(
                      controller: driverBankNameTextController,
                      keyboardType: TextInputType.text,
                      decoration: TextFieldInputDecoration()
                          .getDefaultInputDecoration("은행명을 입력해주세요."),
                    ),
                  ],
                )),
            height20,
            DefaultButtonWidget(
              title: "가입하기",
              callback: () {
                if (widget.userType == UserType.DRIVER) {
                  _joinAccountDriver();
                } else {
                  _join();
                }
              },
            ),
            height30,
          ],
        ).pSymmetric(h: AppSizes.defaultPaddingHorizontalSize),
      ),
    );
  }

  void _join() {
    print("_join");
    String id = idTextController.text;
    String email = emailTextController.text;
    String password = passwordTextController.text;
    String name = nameTextController.text;
    String phone = phoneTextController.text;

    if (id.length < 4) {
      _showSnackbar("아이디는 4자 이상입력해주세요.");
      return;
    }

    if (email.length < 5) {
      _showSnackbar("이메일을 5자 이상으로 입력해주세요.");
      return;
    }

    if (password.length < 4) {
      _showSnackbar("비밀번호는 4자 이상으로 입력해주세요.");
      return;
    }

    if (password != passwordConfirmTextController.text) {
      _showSnackbar("비밀번호가 일치하지 않습니다.");
      return;
    }

    if (name.length < 2) {
      _showSnackbar("이름을 정확히 입력해주세요.");
      return;
    }
    print(phone.length);
    if (phone.length < 11) {
      _showSnackbar("휴대폰 번호를 정확히 입력해주세요.");
      return;
    }

    vm.joinAccount(id, email, password, name, phone);
  }

  void _joinAccountDriver() {
    String id = idTextController.text;
    String email = emailTextController.text;
    String password = passwordTextController.text;
    String name = nameTextController.text;
    String phone = phoneTextController.text;
    String carType = driverCarTypeTextController.text;
    String carNum = driverCarNumTextController.text;
    String bankAccountNumber = driverBankAccountNumberTextController.text;
    String bankName = driverBankNameTextController.text;

    if (id.length < 4) {
      _showSnackbar("아이디는 4자 이상입력해주세요.");
      return;
    }

    if (email.length < 5) {
      _showSnackbar("이메일을 5자 이상으로 입력해주세요.");
      return;
    }

    if (password.length < 4) {
      _showSnackbar("비밀번호는 4자 이상으로 입력해주세요.");
      return;
    }

    if (password != passwordConfirmTextController.text) {
      _showSnackbar("비밀번호가 일치하지 않습니다.");
      return;
    }

    if (name.length < 2) {
      _showSnackbar("이름을 정확히 입력해주세요.");
      return;
    }

    if (phone.length < 11) {
      _showSnackbar("휴대폰 번호를 정확히 입력해주세요.");
      return;
    }
    if (carType.length < 2) {
      _showSnackbar("차량종류를 정확히 입력해주세요.");
      return;
    }
    if (carNum.length < 7) {
      _showSnackbar("차량번호를 정확히 입력해주세요.");
      return;
    }
    if (bankAccountNumber.length < 5) {
      _showSnackbar("계좌번호를 정확히 입력해주세요.");
      return;
    }
    if (bankName.length < 2) {
      _showSnackbar("은행명을 정확히 입력해주세요.");
      return;
    }

    vm.joinDriverAccount(id, email, password, name, phone, carType, carNum,
        bankAccountNumber, bankName);
  }

  void _showSnackbar(String title) {
    context.showSnackbar(title,
        extraButton: Tap(
            onTap: () {
              context.showErrorSnackbar('error');
            },
            child: Container()));
  }
}
