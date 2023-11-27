import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';

class NewsTapButton extends StatelessWidget {
  const NewsTapButton(
      {super.key,
      required this.callback,
      required this.isSelected,
      required this.title});

  final VoidCallback callback;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: callback,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
                isSelected ? AppColors.mainGreenColor : Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side:
                    const BorderSide(color: AppColors.mainGreenColor, width: 0.5),
              borderRadius: BorderRadius.circular(100)
            ),
            ),
        ),
        child: title.text
            .color(isSelected ? Colors.white : AppColors.mainGreenColor)
            .bold
            .make(),
      ),
    );
  }
}
