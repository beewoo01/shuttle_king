import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';

class SettingOperationItemWidget extends StatefulWidget {
  const SettingOperationItemWidget(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.textColor});

  final String title;
  final Color backgroundColor;
  final Color textColor;

  @override
  State<SettingOperationItemWidget> createState() =>
      _SettingOperationItemWidgetState();
}

class _SettingOperationItemWidgetState
    extends State<SettingOperationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderGrey, width: 0.5)),
      child: widget.title.text
          .color(widget.textColor)
          .make()
          .pSymmetric(h: 10, v: 10),
    );
  }
}
