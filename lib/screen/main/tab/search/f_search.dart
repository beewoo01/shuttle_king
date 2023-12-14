import 'package:geolocator/geolocator.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/add/s_add_boarding_location.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/s_apply_line_join.dart';
import 'package:shuttle_king/screen/main/tab/search/vm_search.dart';
import 'package:shuttle_king/screen/main/tab/search/w_input_search_info.dart';
import 'package:shuttle_king/screen/main/tab/search/w_search_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final SearchViewModel viewModel;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<SearchViewModel>()) {
      print("Search initState");
      viewModel = Get.put(SearchViewModel());
      viewModel.getLocation();
    }
  }

  double get defaultTextSize => 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: AppColors.defaultBackgroundGreyColor,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.defaultBackgroundGreyColor,
                  title: "노선 목록"
                      .text
                      .fontFamily("TmonMonsori")
                      .color(AppColors.mainGreenColor)
                      .size(20)
                      .make(),
                  centerTitle: true,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputSearchInfoWidget(
                        callback: () {
                          viewModel.getSearchLineList();
                        },
                      ),
                      height20,
                      const SearchListWidget(),
                      height30
                    ],
                  ).pSymmetric(h: AppSizes.defaultPaddingHorizontalSize, v: 15),
                )
              ],
            )),
        floatingActionButton: Align(
          alignment: const Alignment(1, 0.9),
          child: FloatingActionButton(
              onPressed: () {
                //Position position = getLocationData();
                switch (viewModel.permissionState.value) {
                  case LocationPermission.denied:
                    {
                      Utils.snackBar("위치권한이 필요합니다.", "위치권한을 허용해주세요.");
                      viewModel.getLocation();
                      break;
                    }
                  case LocationPermission.deniedForever:
                    {
                      Utils.snackBar("위치권한이 필요합니다.", "위치권한을 허용해주세요.");
                      viewModel.getLocation();
                      break;
                    }
                  case LocationPermission.whileInUse:
                    {
                      movePage();
                      break;
                    }
                  case LocationPermission.always:
                    {
                      movePage();
                      //viewModel.getLocationData();
                      break;
                    }
                  case LocationPermission.unableToDetermine:
                    {
                      Utils.snackBar("위치권한이 필요합니다.", "위치권한을 허용해주세요.");
                      viewModel.getLocation();
                      break;
                    }
                }
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              backgroundColor: AppColors.mainGreenColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              )),
        ));
  }

  void movePage() {
    if (viewModel.currentLatitude == 0.0 || viewModel.currentLongitude == 0.0) {
      viewModel.getLocationData();
    } else {
      Get.to(AddBoardingLocation(
        latitude: viewModel.currentLatitude,
        longitude: viewModel.currentLongitude,
      ));
    }
  }
}
