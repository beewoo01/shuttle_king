import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/news/event/vo_event.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({super.key, required this.eventVO});

  final EventVO eventVO;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: eventVO.title.text.size(13).make()),
            eventVO.eventCreateTime.text.size(13).make()
          ],
        ),
        height20,
        const Line(
          color: AppColors.borderGrey,
          height: 1,
        ),
        height20,
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.mainGreenColor,
              ),
              child: (eventVO.eventStatus == 0 ? "진행중" : "종료됨")
                  .text
                  .white
                  .size(13)
                  .make()
                  .pSymmetric(h: 10, v: 4),
            ),
            width10,
            "${eventVO.startDate} ~ ${eventVO.endDate}".text.size(14).make(),
          ],
        ),
        height20,
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(20)),
        ),
        height30,
        Expanded(child: eventVO.content.text.make())
      ],
    ).pSymmetric(v: 10, h: 20);
  }
}
