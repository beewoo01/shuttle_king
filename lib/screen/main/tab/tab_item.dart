import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/favorite/f_favorite.dart';
import 'package:shuttle_king/screen/main/tab/home/f_home.dart';
import 'package:shuttle_king/screen/main/tab/serch/f_search.dart';
import 'package:flutter/material.dart';

import 'news/f_news.dart';
import 'news/w_news_tap.dart';

enum TabItem {
  home(Icons.home_filled, '홈', HomeFragment()),
  lineSearch(Icons.search, '노선검색', Search()),
  news(Icons.notifications, '뉴스', News()),
  myInfo(Icons.person_3_rounded, '내 정보', HomeFragment());

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage, {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color:
              isActivated ? context.appColors.selectedColor : context.appColors.iconButtonInactivate,
        ),
        label: tabName);
  }
}
