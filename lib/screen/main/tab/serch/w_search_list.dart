import 'package:shuttle_king/screen/main/tab/serch/vm_search.dart';
import 'package:shuttle_king/screen/main/tab/serch/w_line_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail/apply/s_apply_line_join.dart';
import 'detail/s_line_detail.dart';

class SearchListWidget extends StatefulWidget {
  const SearchListWidget({super.key});

  @override
  State<SearchListWidget> createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  late final viewModel = Get.find<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...viewModel.searchLineList.map((e) => GestureDetector(
            onTap: () {
              print("searchLineList item click");

              Get.to(LineDetailScreen(
                lineIdx: e.line_idx,
              ));
            },
            child: LineItem(e)))
      ],
    );
  }
}
