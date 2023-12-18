import 'package:shuttle_king/common/common.dart';
import 'package:flutter/material.dart';

class BuildAddressLocationWidget extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String iconText;
  final String address;

  const BuildAddressLocationWidget(
      {super.key,
      required this.iconData,
      required this.color,
      required this.iconText,
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
        width10,
        Expanded(child: address.text.color(Colors.black).overflow(TextOverflow.fade).size(15).make())
      ],
    );
  }
}
