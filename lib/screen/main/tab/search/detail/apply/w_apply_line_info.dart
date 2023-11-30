import 'package:flutter/material.dart';
import 'package:shuttle_king/common/widget/w_build_text.dart';

import '../../../../../../common/common.dart';

class ApplyLineInfo extends StatelessWidget {
  const ApplyLineInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          title: "출발지",
          isBold: true,
        ),
        height5,
        BuildText(title: "부산 사상구 사상로 10", size: 16,),

        height20,
        BuildText(
          title: "도착지",
          isBold: true,
        ),
        height5,
        BuildText(title: "부산 사상구 사상로 600번길 600", size: 16),

        height20,
        BuildText(
          title: "운행시간",
          isBold: true,
        ),
        height5,
        BuildText(title: "10시 30분", size: 16),
        height20,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildText(
                    title: "현재인원",
                    isBold: true,
                  ),
                  height5,
                  BuildText(title: "6", size: 16),
                ],
              ),
            ),
            width30,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildText(
                    title: "남은자리수",
                    isBold: true,
                  ),
                  height5,
                  BuildText(title: "10", size: 16),
                ],
              ),
            )


          ],
        ),
        height20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildText(
                    title: "운행 주기",
                    isBold: true,
                  ),
                  height5,
                  BuildText(title: "주 2회 (월, 화)", size: 16),
                ],
              ),
            ),
            width30,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildText(
                    title: "차량종류",
                    isBold: true,
                  ),
                  height5,
                  BuildText(title: "버스", size: 16),
                ],
              ),
            )


          ],
        ),
      ],
    );
  }
}
