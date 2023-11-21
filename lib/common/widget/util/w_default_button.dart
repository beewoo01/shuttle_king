import 'package:shuttle_king/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget(
      {super.key,
      required this.title,
      required this.callback,
      this.backgroundColor = AppColors.mainGreenColor});

  final String title;
  final VoidCallback callback;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: callback,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor)),
        child: title.text.white.make(),
      ),
    );
  }
}
