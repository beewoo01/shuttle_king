import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/w_network_image.dart';
import 'package:shuttle_king/screen/main/tab/news/event/vo_event.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.eventVO});

  final EventVO eventVO;

  @override
  Widget build(BuildContext context) {
    print("EventItem");
    print("${baseImagePath}event/${eventVO.eventImageUrl}");
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderGrey, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height10,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.defaultBackgroundGreyColor,
                border: Border.all(color: AppColors.borderGrey, width: 0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                  child: NetworkImageWidget(
                imageUrl: "${baseImagePath}event/${eventVO.eventImageUrl}",
              )),
            ),
          ),
          height10,
          eventVO.title.text.size(15).make().pSymmetric(h: 10),
          height10,
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: eventVO.eventStatus == 0 ? AppColors.mainGreenColor : Colors.black),
                child: (eventVO.eventStatus == 0 ? "진행중" : "종료됨")
                    .text
                    .white
                    .size(13)
                    .make()
                    .pSymmetric(h: 10, v: 4),
              ).pSymmetric(),
              width10,
              "${eventVO.startDate} ~ ${eventVO.endDate}".text.size(13).make(),
            ],
          ).pSymmetric(h: 10),
          height10
        ],
      ).pSymmetric(h: 10, v: 5),
    ).pSymmetric(h: 5, v: 10);
  }
}
