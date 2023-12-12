import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/news/service/vm_service.dart';
import 'package:shuttle_king/screen/main/tab/news/service/vo_service.dart';

class ServiceItem extends StatefulWidget {
  const ServiceItem(
      {super.key,
      required this.model,
      required this.isClicked,
      required this.callback});

  final ServiceVO model;
  final bool isClicked;
  final VoidCallback callback;

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  ServiceViewModel viewModel = Get.find<ServiceViewModel>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callback();
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            height10,
            height5,
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.mainGreenColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: "Q".text.white.bold.center.make(),
                ),
                width5,
                widget.model.questionDescription
                    .substring(0, 6)
                    .text
                    .maxLines(1)
                    .overflow(TextOverflow.fade)
                    .size(13)
                    .make(),
                const EmptyExpanded(),
                widget.model.questionCreateTime.text
                    .maxLines(1)
                    .overflow(TextOverflow.fade)
                    .size(12)
                    .make(),
              ],
            ).pSymmetric(h: 15),
            height20,
            Visibility(
                visible: widget.isClicked,
                child: Container(
                  width: double.infinity,
                  color: AppColors.defaultBackgroundGreyColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Q: ${widget.model.questionDescription}".text.make(),
                      height10,
                      ("A: ${widget.model.questionAnswerDescription ?? ""}")
                          .text
                          .make(),
                    ],
                  ).pSymmetric(h: 10, v: 10),
                )).pSymmetric(h: 5),
            const Line(
              height: 1,
              color: AppColors.borderGrey,
            ).pSymmetric(h: 5),
            height5,
          ],
        ),
      ),
    );
  }
}
