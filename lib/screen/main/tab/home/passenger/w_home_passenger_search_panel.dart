import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/my/s_my_line_list.dart';
import 'package:shuttle_king/screen/main/tab/search/w_input_search_info.dart';

import 'search/s_search_line.dart';

class HomePassengerSearchPanel extends StatelessWidget {
  const HomePassengerSearchPanel({super.key, required this.callback});
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final Singleton singleton = Singleton();
    return InputSearchInfoWidget(
      callback: () {
        print("InputSearchInfoWidget");
        callback();

      },
    );
  }
}
