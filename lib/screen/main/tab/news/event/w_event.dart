import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/news/event/vm_event.dart';

import 'w_event_item.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    final EventViewModel viewModel = Get.put(EventViewModel());
    viewModel.getEventList();
    return SingleChildScrollView(
      child: Column(
        children: [
          ...viewModel.eventList.map((e) =>
              EventItem(eventVO: e)
          )
        ],
      ),
    );
  }
}
