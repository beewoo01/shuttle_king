import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';
import 'package:shuttle_king/common/widget/w_height_and_width.dart';
import 'package:shuttle_king/screen/main/tab/news/vm_news.dart';
import 'package:shuttle_king/screen/main/tab/news/w_tap_button.dart';

class NewsTap extends StatefulWidget {
  const NewsTap({super.key});

  @override
  State<NewsTap> createState() => _NewsTapState();
}

class _NewsTapState extends State<NewsTap> {
  //int selectedState = 0;
  late final NewsViewModel viewModel ;
  @override
  void initState() {
    super.initState();

    if(!Get.isRegistered<NewsViewModel>()) {
      viewModel = NewsViewModel();
    }
  }
  /*if(GetX.get
  )*/

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: NewsTapButton(
            callback: () {
              viewModel.setCurrentPosition(0);
            },
            isSelected: viewModel.currentPosition == 0,
            title: '공지사항',
          ),
        ),
        width5,
        Expanded(
          child: NewsTapButton(
            callback: () {
              viewModel.setCurrentPosition(1);
            },
            isSelected: viewModel.currentPosition == 1,
            title: '이벤트',
          ),
        ),
        width5,
        Expanded(
          child: NewsTapButton(
            callback: () {
              viewModel.setCurrentPosition(2);
            },
            isSelected: viewModel.currentPosition == 2,
            title: '서비스',
          ),
        )
      ],
    ));
  }
}
