import 'package:shuttle_king/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({super.key, required this.title, required this.callback});
  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: callback,
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
                AppColors.mainGreenColor)),
        child: title.text.white.make(),
      ),
    );
  }
}
