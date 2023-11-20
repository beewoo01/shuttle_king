import 'package:shuttle_king/common/common.dart';
import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  final String title;
  final Color color;
  final bool isBold;
  final double size;

  const BuildText(
      {super.key,
      required this.title,
      this.color = Colors.black,
      this.isBold = false,
      this.size = AppSizes.appDefaultTextSize});

  @override
  Widget build(BuildContext context) {
    return title.text
        .color(color)
        .fontWeight(isBold ? FontWeight.bold : FontWeight.normal)
        .size(size)
        .make();
  }
}
