import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/screen/main/tab/search/drive/s_search_driver.dart';
import 'package:flutter/material.dart';

import 'passenger/s_search_passenger.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColors.defaultBackgroundGreyColor,
          child: Singleton().isDriver!
              ? const SearchDriver()
              : const SearchPassenger()),
    );
  }

}
