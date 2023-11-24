import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:flutter/material.dart';

class BuildSubLineText extends StatelessWidget {
  final String title;
  final String content;
  const BuildSubLineText({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildText(title: title, size: 13, isBold: true, color: AppColors.darkGrey,),
        BuildText(title: content, size: 13, color: AppColors.darkGrey)

      ],
    );
  }
}
