import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/util/a_app_bar.dart';
import 'package:fast_app_base/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:fast_app_base/common/widget/util/w_default_button.dart';
import 'package:fast_app_base/screen/find_account/vm_find_account_info.dart';
import 'package:fast_app_base/screen/find_account/w_find_id.dart';
import 'package:fast_app_base/screen/find_account/w_find_pw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FindAccountInfoScreen extends StatefulWidget {
  const FindAccountInfoScreen({super.key});

  @override
  State<FindAccountInfoScreen> createState() => _FindAccountInfoScreenState();
}

class _FindAccountInfoScreenState extends State<FindAccountInfoScreen> {
  FindAccountViewModel viewModel = Get.put(FindAccountViewModel());

  double get defaultTextSize => 18;

  double get defaultPaddingHorizontalSize => 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar("계정찾기", () {
        Get.back();
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //viewModel.isFindingIdValue?
              Expanded(
                child: Obx(() => TextButton(
                    onPressed: () {
                      viewModel.setFindingState(true);
                    },
                    style: viewModel.isFindingId.value
                        ? buildLineButtonStyle()
                        : buildFullGreyButtonStyle(),
                    child: "아이디찾기"
                        .text
                        .bold
                        .color(viewModel.isFindingId.value
                            ? Colors.black
                            : AppColors.deepGreyColor)
                        .make()
                        .pSymmetric(v: 10))),
              ),

              Expanded(
                child: Obx(() => TextButton(
                    onPressed: () {
                      viewModel.setFindingState(false);
                    },
                    style: !viewModel.isFindingId.value
                        ? buildLineButtonStyle()
                        : buildFullGreyButtonStyle(),
                    child: "비밀번호찾기"
                        .text
                        .bold
                        .color(!viewModel.isFindingId.value
                            ? Colors.black
                            : AppColors.deepGreyColor)
                        .make()
                        .pSymmetric(v: 10))),
              )
            ],
          ),
          height20,
          ///////////
          Obx(
            () => viewModel.isFindingIdValue
                ? const FindIdWidget()
                : const FindPwWidget(),
          ),

          ///////////
          height30,
        ],
      ).pSymmetric(h: defaultPaddingHorizontalSize),
    );
  }

  ButtonStyle buildLineButtonStyle() {
    return TextButton.styleFrom(
        side: const BorderSide(width: 1, color: AppColors.mainGreenColor),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero));
  }

  ButtonStyle buildFullGreyButtonStyle() {
    //deepGreyColor
    return TextButton.styleFrom(
        backgroundColor: AppColors.lightGrey,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero));
  }
}
