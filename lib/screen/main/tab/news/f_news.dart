import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/tab/news/enum_news.dart';
import 'package:shuttle_king/screen/main/tab/news/event/vo_event.dart';
import 'package:shuttle_king/screen/main/tab/news/event/w_event_detail.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/vo_notice.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/w_notice.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/w_notice_detail.dart';
import 'package:shuttle_king/screen/main/tab/news/service/w_service.dart';
import 'package:shuttle_king/screen/main/tab/news/vm_news.dart';
import 'package:shuttle_king/screen/main/tab/news/w_news_tap.dart';

import 'event/w_event.dart';
import 'vo_news.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsViewModel viewModel = Get.put(NewsViewModel());
    /*if (!Get.isRegistered<NewsViewModel>()) {
      viewModel = Get.put(NewsViewModel());
    }*/

    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar("뉴스", () {}, isShowBackButton: false),
      body: Column(
        children: [
          height10,
          const NewsTap(),
          height10,
          Obx(() => Expanded(
                child: switch (viewModel.currentPosition) {
                  NewsPage.notice => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 0.5, color: AppColors.borderGrey)),
                      child: Notice(
                        callback: (NoticeVO noticeVO) {
                          viewModel.setSelectedNoticeDetailItem(noticeVO);
                          viewModel.setCurrentPosition(NewsPage.noticeDetail);
                        },
                      ).pSymmetric(v: 10),
                    ),
                  NewsPage.event => Event(callback: (EventVO eventVO) {
                    viewModel.setSelectedEventDetailItem(eventVO);
                    viewModel.setCurrentPosition(NewsPage.eventDetail);
                  },).pSymmetric(v: 10),
                  NewsPage.service => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 0.5, color: AppColors.borderGrey)),
                      child: const Service().pSymmetric(v: 10),
                    ),

                  NewsPage.noticeDetail => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 0.5, color: AppColors.borderGrey)),
                      child: NoticeDetail(
                          noticeVO: viewModel.selectedNoticeDetailItem!),
                    ),

                  NewsPage.eventDetail => Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 0.5, color: AppColors.borderGrey)),
                    child: EventDetail(
                        eventVO: viewModel.selectedEventDetailItem!),
                  ),
                }
                /*viewModel.currentPosition == NewsPage.notice ||
                    viewModel.currentPosition == NewsPage.service
                    ? Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 0.5, color: AppColors.borderGrey)),
                    child: viewModel.currentPosition == NewsPage.notice
                        ? const Notice().pSymmetric(v: 10)
                        : const Service().pSymmetric(v: 10))
                    : const Event(),*/

                ,
              )),
          height30,
          height10,
        ],
      ).pSymmetric(h: 29),
    );
  }
}
