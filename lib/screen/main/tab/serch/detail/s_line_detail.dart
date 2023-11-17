import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/map/w_nfmap.dart';

class LineDetailScreen extends StatefulWidget {
  final int lineIdx;

  const LineDetailScreen({super.key, required this.lineIdx});

  @override
  State<LineDetailScreen> createState() => _LineDetailScreenState();
}



class _LineDetailScreenState extends State<LineDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar(
          "노선번호 ${widget.lineIdx.toString().padLeft(2, '0')}", () {
            Get.back();
      }),
      body: const Stack(
        children: [
          Positioned.fill(child: FNMapPage())

        ],
      ),
    );
  }
}
