import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/widget/util/d_textfield_inputdecoration.dart';
import 'package:shuttle_king/common/widget/util/w_default_button.dart';

import 'vm_search_drive.dart';

class SearchLineWidget extends StatefulWidget {
  const SearchLineWidget({super.key, required this.callback});

  final VoidCallback callback;

  @override
  State<SearchLineWidget> createState() => _SearchLineState();
}

class _SearchLineState extends State<SearchLineWidget> {
  late final SearchDriveViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Get.find<SearchDriveViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "노선검색".text.size(15).black.bold.make(),
        height10,
        TextField(
          controller: viewModel.startController,
          keyboardType: TextInputType.text,
          decoration:
              TextFieldInputDecoration().getDefaultInputDecoration("입력해주세요."),
        ),
        height10,
        DefaultButtonWidget(title: "찾기", callback: widget.callback)
      ],
    );
  }
}
