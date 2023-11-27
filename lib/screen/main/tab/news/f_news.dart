import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/w_notice.dart';
import 'package:shuttle_king/screen/main/tab/news/service/w_service.dart';
import 'package:shuttle_king/screen/main/tab/news/w_news_tap.dart';

import 'event/w_event.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar("뉴스", () {

      }),
      body: const Column(
        children: [
          height10,
          NewsTap(),
          height10,
          Expanded(
            /*child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0.5, color: AppColors.borderGrey)
              ),
              child: const Notice(),
              //child: const Event(),
            ),*/

              //child: Event(),
              child: Service(),
          ),

          height30,
          height10,


        ],
      ).pSymmetric(h: 29),
    );
  }
}
