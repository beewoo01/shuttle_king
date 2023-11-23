import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/a_app_bar.dart';
import 'package:shuttle_king/screen/main/tab/home/lines/vm_my_lines.dart';
import 'package:shuttle_king/screen/main/tab/home/lines/w_my_lines_item.dart';

class MyLines extends StatefulWidget {
  const MyLines({super.key});

  @override
  State<MyLines> createState() => _MyLinesState();
}

class _MyLinesState extends State<MyLines> {

  late final MyLinesViewModel viewModel;

  @override
  void initState() {
    super.initState();
    if(!Get.isRegistered<MyLinesViewModel>()) {
      viewModel = Get.put(MyLinesViewModel());
    }
    viewModel.getMyLines();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackgroundGreyColor,
      appBar: CustomAppbar().createAppbar("운행노선", () {
        Get.back();
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...viewModel.myLines.map((e) => MyLinesItem(line: e))
          ],
        ).pSymmetric(h: 29),
      ),
    );

  }

}
