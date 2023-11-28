import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/common/widget/w_height_and_width.dart';
import 'package:shuttle_king/screen/main/tab/news/enum_news.dart';
import 'package:shuttle_king/screen/main/tab/news/vm_news.dart';
import 'package:shuttle_king/screen/main/tab/news/w_tap_button.dart';

class NewsTap extends StatefulWidget {
  const NewsTap({super.key});

  @override
  State<NewsTap> createState() => _NewsTapState();
}

class _NewsTapState extends State<NewsTap> {
  final NewsViewModel viewModel = Get.find<NewsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NewsTapButton(
                callback: () {
                  viewModel.setCurrentPosition(NewsPage.notice);
                },
                isSelected: viewModel.currentPosition == NewsPage.notice,
                title: '공지사항',
              ),
            ),
            width5,
            Expanded(
              child: NewsTapButton(
                callback: () {
                  viewModel.setCurrentPosition(NewsPage.event);
                },
                isSelected: viewModel.currentPosition == NewsPage.event,
                title: '이벤트',
              ),
            ),
            width5,
            Expanded(
              child: NewsTapButton(
                callback: () {
                  viewModel.setCurrentPosition(NewsPage.service);
                },
                isSelected: viewModel.currentPosition == NewsPage.service,
                title: '서비스',
              ),
            )
          ],
        ));
  }
}
