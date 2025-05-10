import 'package:emcus_task/core/constants/colors.dart';
import 'package:emcus_task/modules/diagnostics/ui/diagnostics.dart';
import 'package:emcus_task/modules/home/ui/dashboard_screen.dart';
import 'package:emcus_task/modules/maintenance/ui/maintenance.dart';
import 'package:emcus_task/modules/settings/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const DashboardScreen(),
      const MaintenanceScreen(),
      const DiagnosticsScreen(),
      const SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.speed, size: 28),
        title: "Dashboard",
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.whiteColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.handyman, size: 28),
        title: "Maintenance",
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.whiteColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search, size: 28),
        title: "Diagnostics",
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.whiteColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings, size: 28),
        title: "Settings",
        activeColorPrimary: AppColors.whiteColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.whiteColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: AppColors.primaryColor,
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      confineToSafeArea: true,
      navBarHeight: 60,
      navBarStyle: NavBarStyle.style6,
      padding: EdgeInsets.all(8),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        colorBehindNavBar: AppColors.secondaryColor
      ),
    );
  }
}
