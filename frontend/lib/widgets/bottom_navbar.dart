import 'package:flutter/material.dart';
import 'package:go_healthy/shared/routes.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_router/go_router.dart';

import '../../shared/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColor.BLACK7, width: 1.5)),
      ),
      child: BottomNavigationBar(
          currentIndex: pageIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: buildIcon(SvgAssets.home, 0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: buildIcon(SvgAssets.stats, 1),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: buildIcon(SvgAssets.profile, 2), label: ''),
          ],
          unselectedItemColor: AppColor.BLACK5,
          selectedItemColor: AppColor.GREEN4,
          onTap: (int index) {
            setState(() {
              pageIndex = index;
            });
            GoRouter.of(context).go(pagesList[index]);
          }),
    );
  }

  Widget buildIcon(String iconPath, int index) {
    bool isSelected = pageIndex == index;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgAssets.buildSvg(
            iconPath, isSelected ? AppColor.GREEN4 : AppColor.BLACK5),
        if (isSelected)
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            width: 15,
            height: 3,
            decoration: BoxDecoration(
              color: AppColor.GREEN4,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
      ],
    );
  }
}

List<String> pagesList = <String>[
  AppRoute.HOME.path,
  AppRoute.STATS.path,
  AppRoute.PROFILE.path,
];
