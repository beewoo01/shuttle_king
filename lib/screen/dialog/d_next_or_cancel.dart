import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';

class NextOrCancelDialogWidget extends StatelessWidget {
  final String title;
  final VoidCallback cancelCallback;
  final VoidCallback confirmCallback;

  const NextOrCancelDialogWidget({
    super.key,
    required this.title,
    required this.cancelCallback,
    required this.confirmCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Expanded(
              child: Center(
            child: title.text.size(18).black.center.bold.make(),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                width10,
                Expanded(
                    child: DefaultButtonWidget(
                  title: "취소",
                  callback: cancelCallback,
                  backgroundColor: AppColors.deepGreyColor,
                )),
                width10,
                Expanded(
                    child: DefaultButtonWidget(
                        title: "확인", callback: confirmCallback)),
                width10,
              ],
            ),
          )
        ],
      ),
    );
  }
}
