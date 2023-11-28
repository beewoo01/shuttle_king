import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/vo_notice.dart';


class NoticeDetail extends StatelessWidget {
  const NoticeDetail({super.key, required this.noticeVO});

  final NoticeVO noticeVO;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: noticeVO.title.text.size(13).make()),
            noticeVO.noticeCreateTime.text.size(13).make()
          ],
        ),
        height20,
        const Line(color: AppColors.borderGrey, height: 1,),
        height20,
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.purple,
        ),
        height30,
        Expanded(child: noticeVO.content.text.make())
      ],
    ).pSymmetric(v: 10, h: 20);
  }
}

