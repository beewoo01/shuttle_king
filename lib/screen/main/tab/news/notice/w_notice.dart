import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';

import 'vm_notice.dart';
import 'vo_notice.dart';

class Notice extends StatelessWidget {
  const Notice({super.key, required this.callback});

  final Function(NoticeVO noticeVO) callback;

  @override
  Widget build(BuildContext context) {
    late final NoticeViewModel viewModel = Get.put(NoticeViewModel());
    viewModel.getNoticeList();

    return SingleChildScrollView(
      child: Obx(() {
          return Column(
            children: [
              ...viewModel.noticeList.map((e) {
                return GestureDetector(
                  onTap: () {
                    callback(e);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(children: [
                      height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          e.title.text.size(14).make(),
                          e.noticeCreateTime.text.size(14).make()
                        ],
                      ).pSymmetric(h: 10),
                      height20,
                      const Line(color: AppColors.grey, height: 0.5,),
                      height10,
                    ]).pSymmetric(h: 10,),
                  ),
                );
              })
            ],
          );
        }
      ),
    );
  }
}
