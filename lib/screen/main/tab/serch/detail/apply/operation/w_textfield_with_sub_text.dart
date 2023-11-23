import 'package:flutter/material.dart';

import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/common/widget/w_height_and_width.dart';

class TextFieldWithSubText extends StatelessWidget {
  const TextFieldWithSubText({super.key, required this.title, required this.hint, this.hintTextDirection = TextDirection.rtl});
  final String title;
  final String hint;
  final TextDirection hintTextDirection;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(title: title, isBold: true,),
        height5,
        TextField(
          keyboardType: TextInputType.text,
          decoration: TextFieldInputDecoration()
              .getDefaultInputDecoration(hint, hintTextDirection: hintTextDirection),
        )
      ],
    );
  }
}
