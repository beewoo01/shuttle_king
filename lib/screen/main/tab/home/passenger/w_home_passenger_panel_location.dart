import 'package:flutter/material.dart';

import '../../../../../common/common.dart';

class HomeLocationPanel extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String iconText;
  final String? time;
  final String? address;

  const HomeLocationPanel(
      {super.key,
      required this.iconData,
      required this.color,
      required this.iconText,
      required this.time,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              iconData,
              color: color,
            ),
            iconText.text.xs.size(10).color(color).make()
          ],
        ),
        width20,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (time ?? "").text.make(),
            (address ?? "").text.color(Colors.black).size(15).make(),
          ],
        )

      ],
    );
  }
}
