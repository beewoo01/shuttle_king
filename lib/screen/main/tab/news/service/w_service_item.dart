import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/news/service/vo_service.dart';

class ServiceItem extends StatefulWidget {
  const ServiceItem({super.key, required this.model});

  final ServiceVO model;

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            width5,
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.mainGreenColor,
                  borderRadius: BorderRadius.circular(25)),
              child: "Q".text.white.bold.center.make(),
            ),
            width5,
            widget.model.serviceTitle.text.size(13).make(),
            const EmptyExpanded(),
            widget.model.serviceCreateTime.text.size(13).make(),
          ],
        )
      ],
    );
  }
}
