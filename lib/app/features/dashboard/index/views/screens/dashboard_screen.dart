library dashboard;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:market/app/features/dashboard/explore/views/screens/explore_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// model

// component

class DashboardScreen extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _buildNavBarsItems(),
      backgroundColor: Colors.white, // Default is Colors.white.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarHeight: 70,
      navBarStyle: NavBarStyle.style10, // Thay đổi kiểu navbar
    );
  }

  List<Widget> _buildScreens() {
    return [
      ExploreScreen(),
      Center(child: Text("Favorite Screen")),
      Center(child: Text("Messages Screen")),
      Center(child: Text("Profile Screen")),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBarsItems() {
    return [
      _navbarItem(iconData: FontAwesomeIcons.thLarge, title: "Explore"),
      _navbarItem(iconData: FontAwesomeIcons.solidStar, title: "Favorite"),
      _navbarItem(iconData: FontAwesomeIcons.solidCommentAlt, title: "Messages"),
      _navbarItem(iconData: FontAwesomeIcons.userAlt, title: "Profile"),
    ];
  }

  PersistentBottomNavBarItem _navbarItem({
    required IconData iconData,
    required String title,
  }) {
    return PersistentBottomNavBarItem(
      icon: Icon(iconData, size: 22),
      title: (title),
      activeColorPrimary: Colors.blue, // Màu tab được chọn
      inactiveColorPrimary: Colors.grey, // Màu tab không được chọn
    );
  }
}