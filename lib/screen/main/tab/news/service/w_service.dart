import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/news/service/vm_service.dart';
import 'package:shuttle_king/screen/main/tab/news/service/w_service_item.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceViewModel viewModel = Get.put(ServiceViewModel());
    viewModel.getServiceList();

    return SingleChildScrollView(
      child: Obx(() {
        return Column(
          children: [
            ...viewModel.serviceList
                .mapIndexed((element, index) => Obx(() => ServiceItem(
                      model: element,
                      isClicked: viewModel.selectedItem.value == index,
                      callback: () {
                        if (viewModel.selectedItem.value == index) {
                          viewModel.selectedItem.value = -1;
                          return;
                        }
                        viewModel.selectedItem.value = index;
                      },
                    )))
          ],
        );
      }),
    );
  }
}
