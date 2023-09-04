import 'package:flutter/material.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_router/go_router.dart';

import '../../shared/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({required this.child, Key? key}) : super(key: key);

  final StatefulNavigationShell child;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.WHITE,
        border: Border(top: BorderSide(color: AppColor.BLACK7, width: 1.5)),
      ),
      child: BottomNavigationBar(
        onTap: (int value) => _onItemTapped(value),
        backgroundColor: AppColor.WHITE,
        currentIndex: widget.child.currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(SvgAssets.home),
            icon: _buildIcon(SvgAssets.home, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(SvgAssets.stats),
            icon: _buildIcon(SvgAssets.stats, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(SvgAssets.profile),
            icon: _buildIcon(SvgAssets.profile, 2),
            label: '',
          ),
        ],
        unselectedItemColor: AppColor.BLACK5,
        selectedItemColor: AppColor.GREEN4,
      ),
    );
  }

  Widget _buildIcon(String iconPath, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgAssets.buildSvg(
            path: iconPath,
            colorFilter:
                const ColorFilter.mode(AppColor.BLACK5, BlendMode.srcIn)),
      ],
    );
  }

  Widget _buildActiveIcon(String iconPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgAssets.buildSvg(
            path: iconPath,
            colorFilter:
                const ColorFilter.mode(AppColor.GREEN4, BlendMode.srcIn)),
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

  void _onItemTapped(int index) {
    widget.child
        .goBranch(index, initialLocation: index == widget.child.currentIndex);
  }
}
