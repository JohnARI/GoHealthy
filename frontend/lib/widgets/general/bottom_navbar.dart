import 'package:flutter/material.dart';
import 'package:go_healthy/shared/routes.dart';
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
            BottomNavigationBarItem(icon: buildIcon(Icons.home, 0), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.list,
                  color: pageIndex == 1 ? AppColor.GREEN4 : AppColor.BLACK5),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings,
                    color: pageIndex == 2 ? AppColor.GREEN4 : AppColor.BLACK5),
                label: ''),
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

  Widget buildIcon(IconData icon, int index) {
    bool isSelected = pageIndex == index;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.home, color: isSelected ? AppColor.GREEN4 : AppColor.BLACK5),
        if (isSelected)
          Container(
            margin: const EdgeInsets.only(top: 3.0),
            width: 15,
            height: 4,
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
