import 'package:shuttle_king/screen/main/tab/search/vm_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/search/w_line_item.dart';

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
  void initState() {
    super.initState();
    viewModel.getSearchLineList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Column(
          children: [
            ...viewModel.searchLineList.map((e) => GestureDetector(
                onTap: () {
                  Get.to(LineDetailScreen(
                    lineIdx: e.lineIdx,
                  ));
                },
                child: LineItem(e)))
          ],
        );
      }
    );
  }
}
