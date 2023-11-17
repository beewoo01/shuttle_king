import 'package:flutter/material.dart';

import '../../common.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({super.key});

  AppBar createAppbar(String title, VoidCallback callback) {
    return AppBar(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      leading: IconButton(
        onPressed: callback,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.mainGreenColor,
        ),
      ),
      centerTitle: true,
      title: title
          .text
          .fontFamily("TmonMonsori")
          .color(AppColors.mainGreenColor)
          .size(AppSizes.appToolbarTitleTextSize)
          .make(),
    );
  }

}