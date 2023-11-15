import 'package:fast_app_base/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldInputDecoration extends InputDecoration {
  InputDecoration getDefaultInputDecoration(String hint, {Icon? prefixIcon}) {
    return InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.borderGrey),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderGrey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderGrey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        prefixIcon: prefixIcon);
  }
}
