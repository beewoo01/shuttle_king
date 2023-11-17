import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class JoinRegistrationLicense extends StatefulWidget {
  const JoinRegistrationLicense({super.key});

  @override
  State<JoinRegistrationLicense> createState() =>
      _JoinRegistrationLicenseState();
}

class _JoinRegistrationLicenseState extends State<JoinRegistrationLicense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar(
        "회원가입",
        () {
          Get.back();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          "운전면허 등록".text.black.size(18).bold.make(),
          height10,
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.borderGrey, width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_outlined,
                  size: 40,
                  color: AppColors.grey,
                )),
          ),
          height30,
          DefaultButtonWidget(title: "회원가입", callback: () {
            
          })
        ],
      ).pSymmetric(h: 29),
    );
  }
}
