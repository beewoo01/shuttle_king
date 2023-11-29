import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/common/widget/w_height_and_width.dart';

class TextFieldWithSubText extends StatelessWidget {
  const TextFieldWithSubText({super.key,
    required this.title,
    required this.hint,
    this.hintTextDirection = TextDirection.rtl,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.inputFormatters,
  });

  final String title;
  final String hint;
  final TextDirection hintTextDirection;
  final TextInputType textInputType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          title: title,
          isBold: true,
          size: 15,
        ),
        height5,
        TextField(
          keyboardType: textInputType,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          decoration: TextFieldInputDecoration().getDefaultInputDecoration(hint,
              hintTextDirection: hintTextDirection),
        )
      ],
    );
  }
}
