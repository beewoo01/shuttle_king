import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';

class OneTextContainerWidget extends StatefulWidget {
  final String title;
  final double size;
  final VoidCallback callback;

  const OneTextContainerWidget({super.key, required this.title, required this.size, required this.callback});

  @override
  State<OneTextContainerWidget> createState() => _OneTextContainerWidgetState();
}

class _OneTextContainerWidgetState extends State<OneTextContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Container(
        width: widget.size,
        height: widget.size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderGrey, width: 0.5)),
        child: widget.title.text.black.size(15).make(),
      ),
    );
  }
}
