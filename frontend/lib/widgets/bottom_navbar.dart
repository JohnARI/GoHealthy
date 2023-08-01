import 'package:flutter/material.dart';
import 'package:go_healthy/shared/routes.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';

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
        color: AppColor.WHITE,
        border: Border(top: BorderSide(color: AppColor.BLACK7, width: 1.5)),
      ),
      child: BottomNavigationBar(
          backgroundColor: AppColor.WHITE,
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
              icon: buildIcon(SvgAssets.profile, 2),
              label: '',
            ),
          ],
          unselectedItemColor: AppColor.BLACK5,
          selectedItemColor: AppColor.GREEN4,
          onTap: (int index) {
            setState(() {
              pageIndex = index;
            });
            context.navigateNamedRoute(pagesList[index]);
          }),
    );
  }

  Widget buildIcon(String iconPath, int index) {
    bool isSelected = pageIndex == index;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgAssets.buildSvg(
            path: iconPath,
            colorFilter: isSelected
                ? const ColorFilter.mode(AppColor.GREEN4, BlendMode.srcIn)
                : const ColorFilter.mode(AppColor.BLACK5, BlendMode.srcIn)),
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
  AppRoute.HOME.name,
  AppRoute.STATS.name,
  AppRoute.PROFILE.name,
];
