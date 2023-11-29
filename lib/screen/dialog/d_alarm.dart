import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/scaffold/center_dialog_scaffold.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';

class SimpleAlarmDialog extends StatelessWidget {
  const SimpleAlarmDialog({
    super.key,
    required this.title,
    this.buttonText = "확인",
  });

  final String title;
  final String buttonText;

  double get dialogContainerSize => 250;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dialogContainerSize,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Expanded(
              child: Center(
            child: title.text.black.center.size(18).make(),
          )),
          height10,
          DefaultButtonWidget(
            title: buttonText,
            callback: () {
              Get.back();
            },
          ),
          height10,
        ],
      ).pSymmetric(h: 10),
    );
  }
}
