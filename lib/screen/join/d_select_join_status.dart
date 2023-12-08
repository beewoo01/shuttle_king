import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/util/e_user_type.dart';

class SelectJoinStatus extends StatelessWidget {
  const SelectJoinStatus({super.key, required this.callback});

  final Function(UserType userType) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          height20,
          "어떤 계정으로 가입할까요?".text.size(17).bold.make(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                width20,
                Flexible(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainGreenColor),
                    child: TextButton(
                      onPressed: () {
                        print("TextButton 승객");
                        //voidCallback();
                        Get.back();
                        callback(UserType.PASSENGER);
                      },
                      style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent)),
                      child: "승객".text.white.bold.make(),
                    ),
                  ),
                ),
                width20,
                Flexible(
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.defaultBackgroundGreyColor),
                      child: TextButton(
                        onPressed: () {
                          print("TextButton 기사");
                          Get.back();
                          callback(UserType.DRIVER);
                        },
                        style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.transparent)),
                        child: "기사"
                            .text
                            .color(AppColors.mainGreenColor)
                            .bold
                            .make(),
                      )),
                ),
                width20,
              ],
            ),
          ),
          height30
        ],
      ),
    );
  }
}
