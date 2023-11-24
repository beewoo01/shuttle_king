import 'package:flutter/material.dart';
import 'package:shuttle_king/common/util/formatter.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/vo/vo_passenger.dart';

import 'package:shuttle_king/screen/main/widget/w_build_address_location.dart';

import '../../../../../../../../common/common.dart';


class PassengerDetailListItem extends StatefulWidget {
  const PassengerDetailListItem({super.key, required this.passenger});

  final Passenger passenger;

  @override
  State<PassengerDetailListItem> createState() =>
      _PassengerDetailListItemState();
}

class _PassengerDetailListItemState extends State<PassengerDetailListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.borderGrey, width: 0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuildText(
                title: widget.passenger.accountName,
                color: AppColors.mainGreenColor,
                isBold: true,
              ),
              (widget.passenger.isActive == 0 ? "중단" : "이용중")
                  .text
                  .color(widget.passenger.isActive == 0
                      ? Colors.red
                      : AppColors.mainGreenColor)
                  .make()
            ],
          ),
          height10,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.red,
            iconText: "출발",
            address: widget.passenger.startAddress,
          ),
          height5,
          BuildAddressLocationWidget(
            iconData: Icons.location_on,
            color: Colors.blue,
            iconText: "도착",
            address: widget.passenger.endAddress,
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
                    widget.passenger.amount.formatNumber().text.make()
                  ],
                ),
                height5,
                (widget.passenger.isFinishDeposit ? "입금완료" : "입금요청")
                    .text
                    .underline
                    .make(),
                height20,
              ],
            ),
          ).pSymmetric(h: 5, v: 10),
          DefaultButtonWidget(
              title: widget.passenger.isActive == 0 ? "탑승 등록" : "이용 중단 하기",
              backgroundColor: widget.passenger.isActive == 0
                  ? AppColors.darkGrey
                  : AppColors.mainGreenColor,
              callback: () {})
        ],
      ).pSymmetric(h: 15, v: 20),
    );
  }
}
