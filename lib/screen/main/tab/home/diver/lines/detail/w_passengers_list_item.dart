import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/util/formatter.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/dto/dto_line_passengers.dart';

import 'package:shuttle_king/screen/main/widget/w_build_address_location.dart';

import 'vo/vo_passenger.dart';

class PassengersListItem extends StatelessWidget {
  const PassengersListItem({
    super.key,
    required this.passenger,
  });

  final LinePassengersDTO passenger;

  @override
  Widget build(BuildContext context) {
    //debugPrint("${passenger.amount}");
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.borderGrey, width: 0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildText(
            title: passenger.account_name,
            color: AppColors.mainGreenColor,
            isBold: true,
          ),
          height10,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.red,
            iconText: "출발",
            address: passenger.line_location_address,
          ),
          height20,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.blue,
            iconText: "도착",
            address: passenger.line_location_destination_address,
          ),
          height20,
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.defaultBackgroundGreyColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "입금액 : ".text.color(AppColors.darkGrey).bold.make(),
                    (passenger.line_operating_fee_deposit_amount ?? 0)
                        .formatNumber()
                        .text
                        .make()
                  ],
                ),
                height5,
                (passenger.line_operating_fee_deposit_status == 1
                        ? "입금완료"
                        : "입금요청")
                    .text
                    .underline
                    .make(),
                height20,
              ],
            ),
          ).pSymmetric(h: 5),
        ],
      ).pSymmetric(h: 15, v: 20),
    ).pSymmetric(v: 10);
  }
}
