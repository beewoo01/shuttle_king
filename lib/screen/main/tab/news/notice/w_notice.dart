import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';

import 'vm_notice.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {
    late final NoticeViewModel viewModel = Get.put(NoticeViewModel());
    viewModel.getNoticeList();
    /*if (!Get.isRegistered<NoticeViewModel>()) {
      viewModel = Get.put(NoticeViewModel());
      viewModel.getNoticeList();
    }*/

    return SingleChildScrollView(
      child: Column(
        children: [
          ...viewModel.noticeList.map((e) => GestureDetector(
                onTap: () {
                  print("viewModel.noticeList");
                },
                child: Column(children: [
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      e.noticeTitle.text.size(14).make(),
                      e.noticeCreateTime.text.size(14).make()
                    ],
                  ).pSymmetric(h: 10),
                  height20,
                  const Line(color: AppColors.grey, height: 0.5,),
                  height10,
                ]).pSymmetric(h: 10, ),
              ))
        ],
      ),
    );
  }
}
