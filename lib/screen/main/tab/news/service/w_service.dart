import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/news/service/vm_service.dart';
import 'package:shuttle_king/screen/main/tab/news/service/w_service_item.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceViewModel viewModel = Get.put(ServiceViewModel());
    viewModel.getServiceList();

    return SingleChildScrollView(
      child: Column(
        children: [
          ...viewModel.serviceList.map((e) => ServiceItem(model: e,))

        ],
      ),
    );
  }
}
