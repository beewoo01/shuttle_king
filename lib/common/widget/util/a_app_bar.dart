import 'package:flutter/material.dart';

import '../../common.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({super.key});

  AppBar createAppbar(String title, VoidCallback callback, {bool isShowBackButton = true}) {
    return AppBar(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      leading: isShowBackButton ? IconButton(
        onPressed: callback,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.mainGreenColor,
        ),
      ) : Container(),
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